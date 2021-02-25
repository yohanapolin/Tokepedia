from carts.models import *
from carts.serializers import *
from rest_framework import viewsets, permissions
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from carts.models import cart_item
from rest_framework.decorators import action
from carts.serializers import cart_itemSerializer
from rest_framework.decorators import api_view, permission_classes

@api_view(['GET'])
@permission_classes((permissions.AllowAny,))
def apiOverviewCart(request):
	api_urls = {
		'Cart List'		:'carts/list' ,
		'Detail Cart'	:'carts/{id}/cart-detail',
		'Create Cart'	:'carts/add-cart',
		'Update Cart'	:'carts/{id}/update-cart',
		'Delete Cart'	:'carts/{id}/remove',
		'Delete Product from cart' 	: 'carts/product_id/<cart_id/delete-product',
		'adding product to cart'	: 'carts/product_id/<cart_id/add-to-cart',
		}
	return Response(api_urls)

#menampilkkan daftar cart berdasarkan id user
@api_view(['GET'])
@permission_classes([permissions.IsAuthenticated])
def cartlist(request):
	carts = cart_item.objects.filter(user=request.user)
	serializer = cartSerializer(carts, many=True)
	if request.user.is_authenticated:
		return Response(serializer.data)
	return Response(serializer.errors, status=status.HTTP_403_FORBIDDEN)

#menampilkan detail dari salah satu cart
@api_view(['GET'])
@permission_classes([permissions.IsAuthenticated])
def cartdetail(request, pk):
	cart = cart_item.objects.filter(user=request.user)
	carts = cart_item.objects.get(pk=pk, user=request.user)
	serializer = cart_itemSerializer(carts, many=False)
	return Response(serializer.data)

#menambahkan cart	
@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated])
def addcart(request):
	if request.user.is_authenticated:
		serializer = cart_itemSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save(user=request.user)
			return Response(serializer.data)
		else:
			return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	return Response(serializer.errors, status=status.HTTP_403_FORBIDDEN)

#menambahkan produk kedalam cart
@api_view(['PUT'])
@permission_classes([permissions.IsAuthenticated])
def ad(request,  q, id_cart):
	if request.user.is_authenticated:
		prod = Products.objects.filter(pk__in=q)
		cart = cart_item.objects.filter(id = id_cart)
		p = cart_item.products.all(*prod)
		carts = cart_item.objects.create(
			products= prod,
			id = cart,
			user= request.user
		)
		serializer = cart_itemSerializer(p)
		if serializer.is_valid():
			serializer.save( id=id_cart)
			return Response(serializer.data)
		else:
			return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	return Response(serializer.errors, status=status.HTTP_403_FORBIDDEN)

#add product to cart
@api_view(['PATCH'])
@permission_classes([permissions.IsAuthenticated])
def addproductcart(request, cart_id, product_id):
	carts = cart_item.products.through.objects.get(cart_item_id=cart_id)
	serializer = cart_itemSerializer(carts, data=request.data, partial=True)
	if serializer.is_valid():
		serializer.save(products_id=product_id)
		message_susscess ='product was added!'
		return Response(message_susscess)
	return Response(serializer.errors, status=status.HTTP_403_FORBIDDEN)

#update cart     
@api_view(['PATCH', 'GET'])
@permission_classes([permissions.IsAuthenticated])
def cartupdate(request, pk):
	if request.user.is_authenticated:
		cart= cart_item.objects.get(pk=pk)
		serializer = cart_itemSerializer(cart, data=request.data, partial=True)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	return Response(serializer.errors, status=status.HTTP_403_FORBIDDEN)

#menghapus cart berdasarkan user yang sedang login 
@api_view(['DELETE', 'GET'])
@permission_classes([permissions.IsAuthenticated])
def cartdelete(request, pk):
	user=request.user
	carts = cart_item.objects.get(pk=pk, user=request.user)
	if request.user.is_authenticated:
		carts.delete()
		message_susscess ='all item succsesfully delete!'
		return Response(message_susscess)
	return Response(serializer.errors, status=status.HTTP_403_FORBIDDEN)

#delete product from cart
@api_view([ 'DELETE', 'GET'])
@permission_classes([permissions.IsAuthenticated])
def productcartdelete(request, cart_id, product_id):
	carts = cart_item.products.through.objects.get(products_id=product_id,  cart_item_id=cart_id)
	if request.user.is_authenticated:
		carts.delete()
		message_susscess ='item succsesfully delete!'
		return Response(message_susscess)
	return Response(serializer.errors, status=status.HTTP_403_FORBIDDEN)

class OrderViewset(viewsets.ModelViewSet):
    queryset = Order.objects.all()
    serializer_class = cart_itemSerializer
    permission_classes = [permissions.IsAuthenticated]
    
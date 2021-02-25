from product.models import *
from product.serializers import *
from rest_framework import viewsets, permissions
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from product.models import Products
from rest_framework.decorators import action
from product.serializers import ProductsSerializer
from rest_framework.decorators import api_view, permission_classes

class ProductsViewset(viewsets.ModelViewSet):
    queryset = Products.objects.all()
    serializer_class = ProductsSerializer
    permission_classes = [permissions.IsAuthenticated]

class BrandViewset(viewsets.ModelViewSet):
    queryset = Brand.objects.all()
    serializer_class = BrandSerializer
    permission_classes = [permissions.IsAuthenticated]

class CategoryViewset(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    permission_classes = [permissions.IsAuthenticated]

@api_view(['GET'])
@permission_classes((permissions.AllowAny,))
def apiOverviewProduct(request):
	api_urls = {
		'Product List':'products/list-product',
		'Detail Product':'products/{id}/detail-product',
		'Create Product':'products/add-product',
		'Update Product':'products/{id}/update-product',
		'Delete Product':'products/{id}/delete-product',

		'Product Comment List':'products/list-comment',
		'Detail  Comment Product':'products/{id}/list-comment-product',
		'Create  Comment Product':'products/add-comment',
		'Update  Comment Product':'products/{product-id}/{comment-id}/update-comment',
		'Delete  Comment Product':'products/{product-id}/{comment-id}/delete-comment',

		'Reply Comment List':'products/reply-list',
		'Add Reply':'products/add-reply',
		'Update Reply':'products/{id}/update-reply',
		'Delete Reply':'products/{id}/delete-reply',
		}

	return Response(api_urls)

@api_view(['GET'])
@permission_classes((permissions.AllowAny,))
def productlist(request):
	products = Products.objects.all().order_by('id')
	serializer = ProductsSerializer(products, many=True)
	return Response(serializer.data)

@api_view(['GET'])
@permission_classes((permissions.AllowAny,))
def productdetail(request, pk):
	products = Products.objects.get(id=pk)
	serializer = ProductsSerializer(products, many=False)
	return Response(serializer.data)



@api_view(['POST'])
@permission_classes(( permissions.IsAdminUser,))
def add_product(request):
	serializer = ProductsSerializer(data=request.data)

	if serializer.is_valid():
		serializer.save()

	return Response(serializer.data)

@api_view(['PUT'])
@permission_classes((permissions.IsAdminUser,))
def product_update(request, pk):
	products= Products.objects.get(pk=pk)
	serializer =ProductsSerializer(products, data=request.data, partial=True)

	if serializer.is_valid():
		serializer.save()
		return Response(serializer.data)
	return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['DELETE'])
@permission_classes((permissions.IsAdminUser,))
def delete_product(request, pk):
	products = Products.objects.get(id=pk)
	products.delete()

	return Response('Item succsesfully deleted!')

@api_view(['GET'])
@permission_classes([permissions.AllowAny])
def listcomment(request, pk):
	comments = comment.objects.get(product=pk)
	serializer = CommentSerializer(comments, many=True)
	return Response(serializer.data)

@api_view(['GET'])
@permission_classes((permissions.AllowAny,))
def commentlist(request):
	comments = comment.objects.all()
	serializer = CommentSerializer(comments, many=True)
	return Response(serializer.data)

@api_view(['GET'])
@permission_classes([permissions.AllowAny,])
def commentproductlist(request, pk):
	commentss = comment.objects.filter(product=pk)
	serializer = CommentSerializer(commentss, many=True)
	return Response(serializer.data)
	
@api_view(['POST'])
@permission_classes((permissions.IsAuthenticated,))
def add_comment(request):
	if request.user.is_authenticated:
		serializer = CommentSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save(user=request.user)
			return Response(serializer.data)
		else:
			return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['PATCH', 'GET'])
@permission_classes([permissions.IsAuthenticated])
def commentupdate(request, pk,id_comment):
	if request.user.is_authenticated:
		commets= comment.objects.get(id=id_comment,  product=pk, user=request.user,)
		serializer = CommentSerializer(commets, data=request.data, partial=True)
		if serializer.is_valid():
			serializer.save(user=request.user)
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)


@api_view(['DELETE', 'GET'])
@permission_classes([permissions.IsAuthenticated])
def deletecomment(request, pk, id_comment):
	comments = comment.objects.get(id=id_comment,  product=pk, user=request.user )
	if request.user.is_authenticated:
		comments.delete()
		message_susscess ='your comment was deleted!'
		return Response(message_susscess)
	return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)

#Reply Comment	

@api_view(['GET'])
@permission_classes((permissions.AllowAny,))
def repcommentlist(request):
	repcomment = reply_comment.objects.all().order_by('id')
	serializer = ReplyCommentSerializer(repcomment, many=True)
	return Response(serializer.data)

@api_view(['POST'])
@permission_classes((permissions.IsAuthenticated,))
def addreply(request):
	serializer = ReplyCommentSerializer(data=request.data)
	if serializer.is_valid():
		serializer.save(user=request.user)
		serializer.save()
		return Response(serializer.data)
	else:
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE', 'GET'])
@permission_classes((permissions.IsAuthenticated,))
def delete_reply(request, pk):
	reply = reply_comment.objects.get(id=pk, user_reply_id=request.user)
	reply.delete()

	return Response('Reply comment succsesfully deleted!')

@api_view(['PUT', 'GET'])
@permission_classes((permissions.IsAuthenticated,))
def reply_update(request, pk):
	reply= reply_comment.objects.get(pk=pk, user_reply_id=request.user)
	serializer =ReplyCommentSerializer(reply, data=request.data, partial=True)
	if serializer.is_valid():
		serializer.save(user_reply_id=request.user)
		return Response(serializer.data)
	return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)




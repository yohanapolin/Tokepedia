from transaction.models import *
from transaction.serializers import *
from rest_framework import viewsets, permissions
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from transaction.models import Payment
from transaction.models import PaymentType
from rest_framework.decorators import action
from transaction.serializers import PaymentSerializer
from transaction.serializers import PaymentTypeSerializer
from rest_framework.decorators import api_view, permission_classes

class PaymentViewset(viewsets.ModelViewSet):
    queryset = Payment.objects.all()
    serializer_class = PaymentSerializer
    permission_classes = [permissions.IsAuthenticated]

class PaymentTypeViewset(viewsets.ModelViewSet):
    queryset = PaymentType.objects.all()
    serializer_class = PaymentTypeSerializer
    permission_classes = [permissions.IsAuthenticated]

@api_view(['GET'])
@permission_classes((permissions.AllowAny,))
def apiOverviewPayment(request):
	api_urls = {
		'Payment List'			:'payment/payment-list',
		'Detail Payment'		:'payment/{id}/detail-payment',
		'Create Payment'		:'payment/add-payment',
		'Update Payment'		:'payment/{id}/edit-payment',
		'Delete Payment'		:'payment/{id}/delete-payment',
		'Payment Type'			:'payment/payment-type',
		'Detail Payment Type'	:'payment/{id}/detail-payment-type',
		'Create Payment Type'	:'payment/add-payment-type',
		'Update Payment Type'	:'payment/{id}/edit-payment-type',
		'Delete Payment Type'	:'payment/{id}/delete-payment-type',
		}

	return Response(api_urls)

# Payment
@api_view(['GET'])
@permission_classes([permissions.IsAuthenticated])
def paymentList(request):
	payment = Payment.objects.all()
	serializer = PaymentSerializer(payment, many=True)
	return Response(serializer.data)

@api_view(['GET'])
@permission_classes([permissions.IsAuthenticated])
def paymentDetail(request, pk):
	payment = Payment.objects.get(id=pk)
	serializer = PaymentSerializer(payment, many=False)
	return Response(serializer.data)

@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated])
def addPayment(request):
	serializer = PaymentSerializer(data=request.data)

	if serializer.is_valid():
		serializer.save()

	return Response(serializer.data)

@api_view(['PATCH'])
@permission_classes([permissions.IsAuthenticated])
def editPayment(request, pk):
	if request.user.is_authenticated:
		payment= Payment.objects.get(pk=pk)
		serializer = PaymentSerializer(payment, data=request.data, partial=True)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['DELETE',])
@permission_classes([permissions.IsAuthenticated])
def deletePayment(request, pk):
	payment = Payment.objects.get(id=pk)
	payment.delete()
	link = ['']
	message_success ='payment succsesfully deleted!'
	return Response(message_success)

# Payment Type
@api_view(['GET'])
@permission_classes([permissions.IsAuthenticated])
def paymentType(request):
	payment = PaymentType.objects.all()
	serializer = PaymentTypeSerializer(payment, many=True)
	return Response(serializer.data)

@api_view(['GET'])
@permission_classes([permissions.IsAuthenticated])
def paymentTypeDetail(request, pk):
	payment = PaymentType.objects.get(id=pk)
	serializer = PaymentTypeSerializer(payment, many=False)
	return Response(serializer.data)

@api_view(['POST'])
@permission_classes([permissions.IsAuthenticated])
def addPaymentType(request):
	serializer = PaymentTypeSerializer(data=request.data)

	if serializer.is_valid():
		serializer.save()

	return Response(serializer.data)

@api_view(['PATCH'])
@permission_classes([permissions.IsAuthenticated])
def editPaymentType(request, pk):
	if request.user.is_authenticated:
		paymenttype= PaymentType.objects.get(pk=pk)
		serializer = PaymentTypeSerializer(paymentType, data=request.data, partial=True)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['DELETE'])
@permission_classes([permissions.IsAuthenticated])
def deletePaymentType(request, pk):
	paymentType = PaymentType.objects.get(id=pk)
	paymentType.delete()
	link = ['']
	message_success ='payment type succsesfully deleted!'
	return Response(message_success)



from users.models import *
from users.serializers import *
from rest_framework import viewsets, permissions
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from users.models import Customer
from rest_framework.decorators import action
from users.serializers import profileSerializer
from rest_framework.decorators import api_view, permission_classes


#class UserViewset(viewsets.ModelViewSet):
#    queryset = User.objects.all()
#    serializer_class = UserSerializer
#    permission_classes = [permissions.IsAuthenticated]

class profileViewset(viewsets.ModelViewSet):
    queryset = Customer.objects.all()
    serializer_class = profileSerializer
    permission_classes = [permissions.IsAuthenticated]

from django.contrib.auth.models import User

class UserViewset(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
#    permission_classes = [permissions.IsAuthenticated]


@api_view(['GET'])
@permission_classes((permissions.AllowAny,))
def apiOverviewProfile(request):
	api_urls = {
		'Profile List':'customers/',
		'Detail Profile':'customers/{id}/profile-data',
		'Create Profile':'customers/{id}/add-address',
		'Update Profile':'customers/{id}/edit-profile',
		'Delete Profile':'customers/{id}/delete-profile',
		}

	return Response(api_urls)

@api_view(['GET'])
@permission_classes((permissions.AllowAny,))
def apiOverviewAccount(request):
	api_urls = {
		'Account List':'users',
		'Create Account':'users/add',
		'Update Account':'users/{id}/change',
		'Delete Account':'users/{id}/remove',
		}

	return Response(api_urls)
@api_view(['GET'])
@permission_classes((permissions.IsAuthenticated,))
def ProfileList(request):
	profiles = Customer.objects.all()
	serializer = profileSerializer(profiles, many=True)
	return Response(serializer.data)

@api_view(['GET'])
@permission_classes((permissions.IsAuthenticated,))
def profiledetail(request, pk):
	profiles = Customer.objects.get(Id_user=pk)
	serializer = profileSerializer(profiles, many=False)
	return Response(serializer.data)

    
@api_view(['POST'])
@permission_classes((permissions.IsAuthenticated,))
def addAddress(request, pk):
	profiles = Customer.objects.get(Id_user=pk)
	serializer = profileSerializer(data=request.data)

	if serializer.is_valid():
		serializer.save()

	return Response(serializer.data)

@api_view(['PATCH', 'GET'])
@permission_classes((permissions.IsAuthenticated,))
def editProfile(request, pk):
	if request.user.is_authenticated:
		profiles = Customer.objects.get(id=pk)
		serializer = profileSerializer(profiles, data=request.data, partial=True)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['DELETE', 'GET'])
@permission_classes([permissions.IsAuthenticated])
def profiledelete(request, pk):
	profiles = Customer.objects.get(id=pk)
	if request.user.is_authenticated:
		profiles.delete()
		message_susscess ='PROFILE WAS DELETED!'
		return Response(message_susscess)
	return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['GET'])
@permission_classes([permissions.IsAdminUser])
def listuser(request):
	user = User.objects.all()
	serializer = UserSerializer(user, many=True)
	return Response(serializer.data)
   
@api_view(['POST'])
@permission_classes([permissions.AllowAny])
def adduser(request):
	serializer = UserSerializer(data=request.data)
	if serializer.is_valid():
		serializer.save()
		return Response(serializer.data)
	else:
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['PATCH', 'GET'])
@permission_classes([permissions.IsAuthenticated])
def updateuser(request, pk):
	if request.user.is_authenticated:
		user= User.objects.get(pk=pk)
		serializer = UserSerializer(user, data=request.data, partial=True)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)


@api_view(['DELETE', 'GET'])
@permission_classes([permissions.IsAuthenticated])
def deleteuser(request, pk):
	user = User.objects.get(pk=pk)
	if request.user.is_authenticated:
		user.delete()
		message_susscess ='USER WAS DELETED!'
		return Response(message_susscess)
	return Response(serializer.errors, status=status.HTTP_401_UNAUTHORIZED)

    
		

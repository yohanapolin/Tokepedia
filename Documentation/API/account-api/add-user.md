# Add User Type API

Fitur ini digunakan untuk menambahkan data akun baru dari seorang user.
**URI Pattern**:
```
POST/users/add
```
**Request Requirements**:
Setiap data user yang akan ditambahkan, harus sesuai dengan format yang telah ditentukan yaitu username dan email yang ditambahkan harus bersifat unik (belum pernah digunakan sebelumnya). 
Berikut adalah contoh sebuah request yang valid :
```
HTTP 405 Method Not Allowed
Allow: POST, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "detail": "Method \"GET\" not allowed."
}

Media type:
application/json
Content:

    {
        "username": "nunu",
        "first_name": "nunuxy",
        "last_name": "mumu",
        "email": "nunu@gmail.com",
        "password": "mumu01"
    }


```

**Response**:
*Response* yang diberikan dalam bentuk format JSON dengan ketentuan :
- Jika data yang dimasukkan valid maka akan mengembalikan pesan 200 Ok, dengan informasi berupa: id, password, last_login, dan lainnya
Berikut ini adalah contoh *response* yang diberikan ketika data yang dimasukkan valid.
```
HTTP 200 OK
Allow: OPTIONS, POST
Content-Type: application/json
Vary: Accept

{
    "id": 24,
    "password": "mumu01",
    "last_login": null,
    "is_superuser": false,
    "username": "nunu",
    "first_name": "nunuxy",
    "last_name": "mumu",
    "email": "nunu@gmail.com",
    "is_staff": false,
    "is_active": true,
    "date_joined": "2020-12-30T02:36:27.817360Z",
    "groups": [],
    "user_permissions": []
}


```
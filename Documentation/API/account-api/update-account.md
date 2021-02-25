# Update user account Type API

Fitur ini digunakan untuk mengedit data dari sebuah akun tertentu yang ada pada database.
**URI Pattern**:
```
POST/users/{id}/change
```
**Request Requirements**:
Akun hanya dapat diedit oleh user yang telah terautentikasi untuk menjaga keamanan aplikasi dari modifikasi data dari pengguna yang tidak berkepentingan, maka pengguna yang terautentikasi harus dipastikan mengubah data dari akun nya sendiri.
Setiap request akan berisikan payload yang terdiri atas data dari akun yang akan di update.
Berikut adalah contoh sebuah request yang valid :
```

HTTP 200 OK
Allow: PATCH, GET, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "id": 2,
    "password": "pbkdf2_sha256$150000$v3tSYl7zFwQy$82mAbZ15zPxnFa7GPHSwrMzJ/jeQ5ow08kHYWzhmdHw=",
    "last_login": "2020-12-23T00:08:40.311414Z",
    "is_superuser": false,
    "username": "jenn",
    "first_name": "Jennnie",
    "last_name": "Sim",
    "email": "jennie199999@gmail.com",
    "is_staff": false,
    "is_active": true,
    "date_joined": "2020-11-25T02:35:42.407469Z",
    "groups": [],
    "user_permissions": []
}

Media type:
application/json
Content:

    {
    "username": "jenn",
    "first_name": "Jennnie",
    "last_name": "Simamora",
    "email": "jennie199999@gmail.com",
    "password": "ppwawss"
    }

```

**Response**:
*Response* yang diberikan dalam bentuk format JSON dengan ketentuan :
- Jika credential tidak valid, maka akan dikembalikan pesan kesalahan (403). Sebaliknya (200), ketika credential valid dan akan dikembalikan data yang telah diupdate.
Berikut ini adalah contoh *response* yang diberikan ketika credential yang diberikan valid.
```
HTTP 200 OK
Allow: PATCH, GET, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "id": 2,
    "password": "ppwawss",
    "last_login": "2020-12-23T00:08:40.311414Z",
    "is_superuser": false,
    "username": "jenn",
    "first_name": "Jennnie",
    "last_name": "Simamora",
    "email": "jennie199999@gmail.com",
    "is_staff": false,
    "is_active": true,
    "date_joined": "2020-11-25T02:35:42.407469Z",
    "groups": [],
    "user_permissions": []
}

```
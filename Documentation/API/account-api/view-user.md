# Vuew user (only by Admin) Type API

Fitur ini digunakan untuk melihat daftar dari keselurhan data akun dari semua user yang ada pada database.
**URI Pattern**:
```
POST/users
```
**Request Requirements**:
Untuk dapat meilhat daftar dari seluruh data akun user yang ada pada aplikasi, maka pengguna yang berhak melakukannya adalah hanya oleh Admin saja. Hal ini dilakukan untuk menjaga keamanan data dari setiap user.
Berikut adalah contoh sebuah request yang valid :
```

GET http://localhost/account/users HTTP/1.1
Host: localhost
Connection: Keep-Alive


```

**Response**:
*Response* yang diberikan dalam bentuk format JSON dengan ketentuan :
- Jika credential tidak valid, maka akan dikembalikan pesan kesalahan (403)Foribidden. Sebaliknya (200), ketika credential valid serta yang masuk adalah Admin, maka akan dikembalikan daftar data akun setiap user.
Berikut ini adalah contoh *response* yang diberikan ketika credential yang diberikan valid.
```
HTTP 200 OK
Allow: GET, OPTIONS
Content-Type: application/json
Vary: Accept

[
    {
        "id": 1,
        "password": "pbkdf2_sha256$150000$rqqqYBMIZwU3$G5hXzBbNB/jf+Pa7CgFgY9FqwuVJMAjM/fF583NexvE=",
        "last_login": "2020-12-11T02:15:04.480510Z",
        "is_superuser": false,
        "username": "jenniecantik",
        "first_name": "Yohana Polin Simatupang",
        "last_name": "gultom",
        "email": "jenniebaik@gmail.com",
        "is_staff": false,
        "is_active": true,
        "date_joined": "2020-11-24T08:59:46.563116Z",
        "groups": [],
        "user_permissions": []
    },
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
    },
    {
        "id": 3,
        "password": "pbkdf2_sha256$150000$fMVBoaXYApSf$S1K98W4ubstHWblEF8CwTkNGX5HyG6KZ4fAykdZwkgw=",
        "last_login": "2020-12-13T05:21:06.763012Z",
        "is_superuser": false,
        "username": "jenni",
        "first_name": "jennie",
        "last_name": "simatupang",
        "email": "febbyirenee@gmail.com",
        "is_staff": false,
        "is_active": true,
        "date_joined": "2020-11-28T01:03:02.266233Z",
        "groups": [],
        "user_permissions": []
    }
]
```
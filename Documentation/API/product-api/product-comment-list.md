# Product Comment List
Fitur api ini digunakan untuk melihat list semua komentar product di Tokepedia.

**URI Pattern**
```
GET /products/list-comment
```

**Request Requirements:**
Untuk melakukan *request* *comment list* **Product** diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*. 
```
HTTP 200 OK
Allow: OPTIONS, GET
Content-Type: application/json
Vary: Accept
```

**Response :**
_Response_ diberikan dalam format JSON dengan ketentuan sebagai berikut:
-  200 (OK) Jika request berhasil dilakukan.
```
HTTP 200 OK
Allow: OPTIONS, GET
Content-Type: application/json
Vary: Accept

[
    {
        "id": 2,
        "comment": "waw",
        "user": 11,
        "product": "003"
    },
    ...
    ...
    ...
]
```

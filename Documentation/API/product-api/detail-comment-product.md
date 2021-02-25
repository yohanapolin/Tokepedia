# Detail  Comment Product
Fitur api ini digunakan untuk melihat list semua komentar dari satu product di Tokepedia.

**URI Pattern**
```
GET /products/{id}/list-comment-product
```

**Request Requirements:**
Untuk melakukan *request* *detail comment* **Product** diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*. Untuk dapat melihat semua comment dari satu *product*, input *URI* harus menyertakan *id* dari *product* tersebut. Berikut tampilan jika request valid. 
```
HTTP 200 OK
Allow: OPTIONS, GET
Content-Type: application/json
Vary: Accept
```
Namun jika *request* tidak *valid*, maka keluaran akan menjadi 

    HTTP 401 AUnauthorized
    Allow: GET, OPTIONS
    Content-Type: application/json
    Vary: Accept
    
    {
        Error message : “Authentication credentials were not provided”
    }

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
        "id": 3,
        "comment": "waw",
        "user": 11,
        "product": "006"
    },
    ...
    ...
    ...
]
```

- 404 (Not Found) Jika *URI* tidak *valid* atau *comment* tidak ada.
```
HTTP 404 NOT FOUND
Allow: GET, OPTIONS
Content-Type: application/json
Vary: Accept

{
    Error message: "Can not process your request"
}
```

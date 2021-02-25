# Update  Comment Product
Fitur api ini digunakan untuk memperbaharui komentar dari satu product di Tokepedia.

**URI Pattern**
```
PATCH /products/{product-id}/{comment-id}/update-comment
```

**Request Requirements:**
Untuk melakukan *request* memperbaharui **Product** *comment* diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*. Untuk dapat memperbaharui suatu *product comment*, input *URI* harus menyertakan *id* dari *product* tersebut dan *id* dari *comment*. Berikut tampilan jika request valid. 
```
HTTP 200 OK
Allow: PATCH, GET, OPTIONS
Content-Type: application/json
Vary: Accept

```
Namun jika *request* tidak *valid*, maka keluaran akan menjadi 

    HTTP 401 AUnauthorized
    Allow: PATCH, GET, OPTIONS
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
Allow: PATCH, GET, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "id": 10,
    "comment": "mantap banget",
    "user": 20,
    "product": "001"
}
```

- 404 (Not Found) Jika *URI* tidak *valid* atau *comment* tidak ada.
```
HTTP 404 NOT FOUND
Allow: PATCH, GET, OPTIONS
Content-Type: application/json
Vary: Accept

{
    Error message: "Can not process your request"
}
```

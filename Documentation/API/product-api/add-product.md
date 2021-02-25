# Add Product
Fitur api ini digunakan untuk menambahkan product di Tokepedia.

**URI Pattern**
```
POST /products/add-product
```

**Request Requirements:**
Untuk melakukan *request* add **Product** diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*. Untuk dapat menambahkan suatu *product*, input *JSON* harus dilakukan dengan data  *product* yang akan ditambahkan. Berikut adalah tampilan *request valid*.
```
HTTP 405 Method Not Allowed
Allow: OPTIONS, POST
Content-Type: application/json
Vary: Accept

{
    "detail": "Method \"GET\" not allowed."
}
```

Namun jika request tidak valid, maka keluaran akan menjadi 

    HTTP 403 Forbidden
    Allow: POST, OPTIONS
    Content-Type: application/json
    Vary: Accept
    
    {
        "detail": "You do not have permission to perform this action."
    }

**Response :**
_Response_ diberikan dalam format JSON dengan ketentuan sebagai berikut:
-  200 (OK) Jika request berhasil dilakukan.
```
HTTP 200 OK
Allow: OPTIONS, POST
Content-Type: application/json
Vary: Accept

{
    "id": "049",
    "name": "ASUS VIVABOOK 14 K413FQ i7-10510U",
    "price_per_unit": 1238000,
    "stock": 122,
    "description": "New"
}
```

- 422 (Unprocessable Entity) Jika request tidak valid.
```
HTTP 422 UNPROCESSABLE ENTITY
Allow: POST, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "error_message": "Can not process your request"
}
```

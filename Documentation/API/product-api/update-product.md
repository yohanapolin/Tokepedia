# Update Product
Fitur api ini digunakan untuk memperbaharui data product di Tokepedia.

**URI Pattern**
```
PUT /products/{id}/update-product
```

**Request Requirements:**
Untuk melakukan *request* *update* **Product** diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*. Untuk dapat meng-*update* suatu *product*,input *URI* harus menyertakan *id* dari *product* tersebut dan input  *JSON* harus dilakukan dengan data  *product* yang akan ditambahkan. Berikut adalah tampilan *request valid*.
```
HTTP 405 Method Not Allowed
Allow: OPTIONS, PUT
Content-Type: application/json
Vary: Accept

{
    "detail": "Method \"GET\" not allowed."
}
```

Namun jika request tidak valid, maka keluaran akan menjadi 

    HTTP 403 Forbidden
    Allow: PUT, OPTIONS
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
Allow: PUT, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "id": "049",
    "name": "ASUS VIVABOOK 14 K413FQ i7-10510U",
    "price_per_unit": 1268000,
    "stock": 110,
    "description": "New"
}
```

- 422 (Unprocessable Entity) Jika request tidak valid.
```
HTTP 422 UNPROCESSABLE ENTITY
Allow: PUT, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "error_message": "Can not process your request"
}
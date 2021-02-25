# Delete Product
Fitur api ini digunakan untuk meghapus product di Tokepedia.

**URI Pattern**
```
PUT /products/049/update-product
```

**Request Requirements:**
Untuk melakukan *request* *delete* **Product** diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*. 
```
HTTP 405 Method Not Allowed
Allow: OPTIONS, DELETE
Content-Type: application/json
Vary: Accept

{
    "detail": "Method \"GET\" not allowed."
}
```

Namun jika request tidak valid, maka keluaran akan menjadi 

    HTTP 403 Forbidden
    Allow: DELETE, OPTIONS
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
Allow: OPTIONS, DELETE
Content-Type: application/json
Vary: Accept

"Item succsesfully deleted!"
```

- 422 (Unprocessable Entity) Jika request tidak valid.
```
HTTP 422 UNPROCESSABLE ENTITY
Allow: DELETE, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "error_message": "Can not process your request"
}
```
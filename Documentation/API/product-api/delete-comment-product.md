# Delete  Comment Product
Fitur api ini digunakan untuk menghapus komentar dari satu product di Tokepedia.

**URI Pattern**
```
DELETE /products/{product-id}/{comment-id}/delete-comment
```

**Request Requirements:**
Untuk melakukan *request* menghapus **Product** *comment* diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*. Untuk dapat menghapusi suatu *product comment*, input *URI* harus menyertakan *id* dari *product* tersebut dan *id* dari *comment*. Berikut tampilan jika request valid. 
```
HTTP 200 OK
Allow: OPTIONS, DELETE, GET
Content-Type: application/json
Vary: Accept

```
Namun jika *request* tidak *valid*, maka keluaran akan menjadi 

    HTTP 401 AUnauthorized
    Allow: DELETE, GET, OPTIONS
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
Allow: OPTIONS, DELETE, GET
Content-Type: application/json
Vary: Accept
{
	message: "your comment was deleted!"
}
```

- 404 (Not Found) Jika *URI* tidak *valid* atau *comment* tidak ada.
```
HTTP 404 NOT FOUND
Allow: DELETE, GET, OPTIONS
Content-Type: application/json
Vary: Accept

{
    Error message: "Can not process your request"
}
```

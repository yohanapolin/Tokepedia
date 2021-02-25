# Create  Comment Product
Fitur api ini digunakan untuk menambahkan komentar dari satu product di Tokepedia.

**URI Pattern**
```
POST /products/add-comment
```

**Request Requirements:**
Untuk melakukan *request* menambahkan **Product** diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*. Berikut tampilan jika request valid. 
```
HTTP 405 Method Not Allowed
Allow: POST, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "detail": "Method \"GET\" not allowed."
}
```
Namun jika *request* tidak *valid*, maka keluaran akan menjadi 

    HTTP 401 AUnauthorized
    Allow: POST, OPTIONS
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
Allow: POST, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "id": 10,
    "comment": "mantap",
    "user": 20,
    "product": "001"
}
```

- 404 (Not Found) Jika *URI* tidak *valid*.
```
HTTP 404 NOT FOUND
Allow: POST, OPTIONS
Content-Type: application/json
Vary: Accept

{
    Error message: "Can not process your request"
}
```

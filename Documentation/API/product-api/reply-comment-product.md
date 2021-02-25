# Reply  Comment Product
Fitur api ini digunakan untuk membalas komentar dari satu product di Tokepedia.

**URI Pattern**
```
POST /products/add-reply
```

**Request Requirements:**
Untuk melakukan *request* membalas **Product** *comment* diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*.  Berikut tampilan jika request valid. 
```
HTTP 405 Method Not Allowed
Allow: POST, OPTIONS
Content-Type: application/json
Vary: Accept
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
-  201 (Created) Jika request berhasil dilakukan.
```
HTTP 201 CREATED
Allow: OPTIONS, POST
Content-Type: application/json
Vary: Accept
{
	 "id": 1,
	 "comment_id": 3,
	 "user_reply_id": 3,
	 "reply_comment": "asada\r\n\r\n"
 }
```

- 404 (Not Found) Jika *URI* tidak *valid* atau *comment* tidak ada.
```
HTTP 404 NOT FOUND
Allow: POST, OPTIONS
Content-Type: application/json
Vary: Accept

{
    Error message: "Can not process your request"
}
```

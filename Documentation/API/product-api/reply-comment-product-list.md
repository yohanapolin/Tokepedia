# Reply  Comment Product List
Fitur api ini digunakan untuk melihat balasan komentar dari product di Tokepedia.

**URI Pattern**
```
GET /products/reply-list
```

**Request Requirements:**
Untuk melakukan *request* melihat balasan **Product** *comment* diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*.  Berikut tampilan jika request valid. 
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
	 "id": 1,
	 "comment_id": 3,
	 "user_reply_id": 3,
	 "reply_comment": "asada\r\n\r\n"
  },
  ...
  ...
  ...
]
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

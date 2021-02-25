# Update Reply  Comment Product
Fitur api ini digunakan untuk memperbaharui balasan komentar dari satu product di Tokepedia.

**URI Pattern**
```
PATCH /products/{id}/update-reply
```

**Request Requirements:**
Untuk melakukan *request* memperbaharui balasan **Product** *comment* diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*.  Untuk dapat melihat balasan comment dari satu *product*, input *URI* harus menyertakan *id* dari *reply* tersebut. Berikut tampilan jika request valid. 
```
HTTP 201 CREATED
Allow: OPTIONS, PATCH
Content-Type: application/json
Vary: Accept
```
Namun jika *request* tidak *valid*, maka keluaran akan menjadi 

    HTTP 401 AUnauthorized
    Allow: PATCH, OPTIONS
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
Allow: OPTIONS, PATCH
Content-Type: application/json
Vary: Accept
{
	 "id": 1,
	 "comment_id": 3,
	 "user_reply_id": 3,
	 "reply_comment": "okelah kalo gitu
 }
```

- 404 (Not Found) Jika *URI* tidak *valid* atau *comment* tidak ada.
```
HTTP 404 NOT FOUND
Allow: PATCH, OPTIONS
Content-Type: application/json
Vary: Accept

{
    Error message: "Can not process your request"
}
```

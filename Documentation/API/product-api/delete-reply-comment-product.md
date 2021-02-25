# Delete Reply  Comment Product
Fitur api ini digunakan untuk menghapus balasan komentar dari satu product di Tokepedia.

**URI Pattern**
```
DELETE /products/{id}/delete-reply
```

**Request Requirements:**
Untuk melakukan *request* menghapus balasan **Product** *comment* diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*.  Untuk dapat melihat balasan comment dari satu *product*, input *URI* harus menyertakan *id* dari *reply* tersebut. Berikut tampilan jika request valid. 
```
HTTP 200 OK
Allow: OPTIONS, GET
Content-Type: application/json
Vary: Accept
```
Namun jika *request* tidak *valid*, maka keluaran akan menjadi 

    HTTP 401 Unauthorized
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
Allow: OPTIONS, DELETE
Content-Type: application/json
Vary: Accept
{
	message : “reply has been deleted”
}
```

- 404 (Not Found) Jika *URI* tidak *valid* atau *comment* tidak ada.
```
HTTP 404 NOT FOUND
Allow: PATCH, DELETE
Content-Type: application/json
Vary: Accept

{
    Error message: "Can not process your request"
}
```

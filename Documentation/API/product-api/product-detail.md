# Product Detail
Fitur api ini digunakan untuk melihat detail dari suatu product yang ada di Tokepedia.

**URI Pattern**
```
GET /products/{id}/detail-product
```

**Request Requirements:**
Untuk melakukan *request* detail **Product** diperlukan *authorization* berupa *token* atau akun dengan *username* dan *password*. Untuk dapat melihat detail suatu *product*, input *URI* harus menyertakan *id* dari *product* tersebut. Berikut adalah tampilan *request valid*.
```
HTTP 200 OK
Allow: GET, OPTIONS
Content-Type: application/json
Vary: Accept
```

**Response :**
_Response_ diberikan dalam format JSON dengan ketentuan sebagai berikut:
-  200 (OK) Jika request berhasil dilakukan.
```
HTTP 200 OK
Allow: GET, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "id": "002",
    "name": "LAPTOP ASUS i5 RAM 8GB HDD",
    "price_per_unit": 9899000,
    "stock": 122,
    "description": "New"
}
```

- 400 (Bad Request) Jika request tidak valid.
```
HTTP 400 BAD REQUEST
Allow: GET, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "error_message": "Can not process your request"
}
```
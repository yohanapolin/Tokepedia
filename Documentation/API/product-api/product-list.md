# Product List
Fitur api ini digunakan untuk melihat list dari product yang ada di Tokepedia.

**URI Pattern**
```
GET /products/list-product
```

**Request Requirements:**
Untuk melakukan *request* **Product List** tidak diperlukan *authorization*. Berikut adalah tampilan *request valid*.
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

[
    {
        "id": "001",
        "name": "ASUS VIVOBOOK 14 K413FQ i7-10510U",
        "price_per_unit": 12368000,
        "stock": 122,
        "description": "New"
    },
    ...
    ...
    ...
]
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

# Card Add API
Fitur ini digunakan oleh pengguna untuk menambahkan cart berdasarkan user yang sedang login.
**URI Pattern**
```
POST /carts/add-cart
```
**Request Requirements:**
 Setiap proses penambahan cart, kita juga dapat memasukan data berupa item produk yang menjadi bagian dari cart. Secara default sistem akan mengambil data user berdasarkan id yang sedang login. Membutuhkan .Authorization token  atau username dan password yang terdaftar dalam database aplikasi.

**Response :**
- 403 Response : Respon yang akan ditampilkan jika menambahkan cart tanpa melakukan autentikasi pengguna atau token.
```
HTTP 403 Forbidden
Allow: GET, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "detail": "Authentication credentials were not provided."
}
```
- 200 Response : Respon yang akan ditampilkan jika berhasil melakukan pemabahan cart. Selain itu, akan ditampilkan juga data yang telah ditambahkan.
```
HTTP 200 OK
Allow: POST, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "id": 115,
    "user": 11,
    "ordered": false,
    "products": [
        "001"
    ],
    "quantity": 1,
    "subtotal": 12368000,
    "total": 12388000,
    "updated": "2020-12-28T14:16:23.860601Z",
    "timestamp": "2020-12-28T14:16:23.398836Z"
}

```
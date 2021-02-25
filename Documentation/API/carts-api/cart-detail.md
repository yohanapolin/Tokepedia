# Cart Detail API
Fitur ini digunakan oleh setiap pengguna untuk menampilkan daftar produk, total pengeluaran untuk setiap barang yang terdapat dalam cart.
**URI Pattern**
```
GET /carts/{id_cart}/cart-detail
```
**Request Requirements:**
Setiap pengguna yang akan mengakses URI API untuk melihat detail cart perlu melakukan autentikasi baik berupa token ataupun mengunakan username dan password. Untuk dapat melihat detail dari cart maka setiap pengguna perlu memasukan id cart sesuai dengan yang ia miliki.

**Response :**
- 200 Response : Respon yang akan ditampilkan jika berhasil melakukan pengaksesan informasi detail cart. Respon ini akan ditampilkan jika pengguna memiliki auntentikasi akun yang valid.
```
HTTP 200 OK
Allow: OPTIONS, GET
Content-Type: application/json
Vary: Accept

{
    "id": 116,
    "user": 11,
    "ordered": false,
    "products": [],
    "quantity": 1,
    "subtotal": 19850000,
    "total": 19870000,
    "updated": "2020-12-29T15:58:41.237484Z",
    "timestamp": "2020-12-28T14:40:34.498122Z"
```
- 403 Response : Respon yang akan ditampilkan jika menambahkan cart tanpa melakukan autentikasi pengguna atau token.
```
HTTP 403 Forbidden
Allow: OPTIONS, GET
Content-Type: application/json
Vary: Accept

{
    "detail": "Authentication credentials were not provided."
}
```


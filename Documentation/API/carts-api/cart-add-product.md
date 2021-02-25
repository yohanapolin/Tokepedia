# Add Product To Cart
Fitur api ini digunakan oleh pengguna aplikasi Tokepedia untuk menambahkan produk kedalam cart. 

**URI Pattern**
```
PATCH /carts/id_product/id_cart/add-to-cart
```

**Request Requirements:**
Untuk dapat melakukan penambahan produk kedalam keranjang diperlukan authorization token atau memasukan username dan password dengan mengunakan basic auth pada saat melakukan pencobaan fungsi api pada tools Testing API. Berikut adalah tampilan jika autentikasi akun valid.
```
HTTP 405 Method Not Allowed
Allow: PATCH, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "detail": "Method \"GET\" not allowed."
}
```

**Response :**
- 200 Response : Response tersebut akan ditampilkan jika pengguna melakukan autentikasi. untuk mendempkan URI tesebut user perlu memasukan id_product dan id_cart.
berikut adalah salah satu contoh response dari 200 pada pengujian add-to-cart API.
```
HTTP 200 OK
Allow: PATCH, OPTIONS
Content-Type: application/json
Vary: Accept

"product was added!"
```

- 403 Response : Respon akan ditampilkan jika pengguna tidak melakukan autentikasi saat melakukan pengujian API.
berikut adalah salah satu contoh response dari 403 pada pengujian add-to-cart API.
```
HTTP 403 Forbidden
Allow: PATCH, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "detail": "Authentication credentials were not provided."
}
```
- 400 Response : Respon 400 akan tiampilkan jika pengguna memasukan id cart atau produk yang tidak terdapat dalam sistem database aplikasi.

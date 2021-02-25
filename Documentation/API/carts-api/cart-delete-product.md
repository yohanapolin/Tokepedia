# Delete Product From Cart 
Fitur api ini digunakan oleh pengguna aplikasi web Tokepedia untuk menghapus salah satu item yang ada pada cart pengguna.

**URI Pattern**
```
DELETE /carts/id_product/id_cart/delete-product
```

**Request Requirements:**
Untuk dapat melakukan mengapus produk dalam keranjang diperlukan authorization token atau memasukan username dan password dengan mengunakan basic auth pada saat melakukan pencobaan fungsi api pada tools Testing API. Selain itu pengguna harus memastikan bahwa id product terdaftar pada sistem database Tokepedia.

**Response :**
- 200 Response : Response tersebut akan ditampilkan jika pengguna melakukan autentikasi. untuk mengunakan  URI tesebut user perlu memasukan id_product dan id_cart.
```
HTTP 200 OK
Allow: OPTIONS, DELETE, GET
Content-Type: application/json
Vary: Accept

"item succsesfully delete!"
```

- 403 Response : Respon akan ditampilkan jika pengguna tidak melakukan autentikasi saat melakukan pengujian API.
```
HTTP 403 Forbidden
Allow: OPTIONS, DELETE, GET
Content-Type: application/json
Vary: Accept

{
    "detail": "Authentication credentials were not provided."
}
```

- 500 Response : Repson yang akan ditampilkan ketika kita melakukan penghapusan pada data yang tidak terdaftar pada server aplikasi.


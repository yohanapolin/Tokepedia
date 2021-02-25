# Cart Delete API
Fitur Delete Cart API dapat digunakan untuk mehapus secara keseluruhan daftar dari produk yang telah dimasukan kedalam keranjang.
**URI Pattern**
```
DELETE /carts/id_cart/remove-cart

```

**Request Requirements:**
untuk dapat menjalankan fungsi API delete cart diperlukan autentikasi pengguna dengan mengunakan token ataupun basic auth dengan memasukan username dan password. Selain itu diperlukan id dari cart akan dihapus. 

**Response :**
- 403 Response : Respon yang akan ditampilkan jika user mengakses fungsi delete tanpa melakukan proses autentikasi akun yang benar(Seperti tidak menyertakan token auth atau username dan password yang valid). Selain itu reponse tersebut juga akan ditampilkan jika user mencoba mengapus id cart yang merupakan milik dari user lain.
```
HTTP 403 Forbidden
Allow: GET, DELETE, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "detail": "Authentication credentials were not provided."
}
```

- 200 Response : Repson yang akan ditampilkan jika berhasil melakukan penghapusan data cart.
```
HTTP 200 OK
Allow: GET, DELETE, OPTIONS
Content-Type: application/json
Vary: Accept

"all item succsesfully delete!"
```

- 500 Response : Respon akan ditampilkan ketika kita melakukan penghapusan pada data yang tidak terdaftar pada server aplikasi.

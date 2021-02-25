# Cart Update API
Fitur cart update api merupakan salah satu fitur yang dapat digunakan oleh setiap pengguna Tokepedia yang sedang aktif (Login) pada aplikasi. Hal yang dapat diupdate berupa jumlah produk. Setiap pengguna dapat menambahkan atau mengurangi list pada produk. 
**URI Pattern**
```
PATCH /carts/{id_cart}/update-quantity
```

**Request Requirements:**
Untuk dapat melakukan pembaruan pada cart diperlukan authorization token atau memasukan username dan password dengan mengunakan basic auth pada saat melakukan pencobaan fungsi api pada tools Testing API. Diperlukan juga data yang akan diperbarui dengan format JSON file.
```
{
"products" : "001"
}
```

**Response :**
- 403 Response : Respon yang akan ditampilkan jika mengupdate cart tanpa melakukan autentikasi pengguna atau token. Selain itu response tersebut akan ditampilkan jika pengguna melakukan update pada id cart yang dimiiliki oleh user lainnya.
```
HTTP 403 Forbidden
Allow: PATCH, GET, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "detail": "Authentication credentials were not provided."
}
```

- 200 Response :  Respon yang akan ditampilkan jika berhasil melakukan pembaruan data cart. Selain itu, akan ditampilkan juga data yang telah diperbarui.
```
HTTP 200 OK
Allow: PATCH, GET, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "id": 97,
    "user": 11,
    "ordered": false,
    "products": [
        "001"
    ],
    "quantity": 1,
    "subtotal": 12368000,
    "total": 12388000,
    "updated": "2020-12-28T14:26:17.701452Z",
    "timestamp": "2020-12-13T05:59:46.484960Z"
}
```
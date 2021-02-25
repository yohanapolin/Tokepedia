# cart list API

Fitur ini digunakan untuk menampilkan daftar produk yang sudah  dimasukan oleh pengguna kedalam keranjang (Cart).
**URI Pattern**:
```
GET /carts/list
```
**Request Requirements**:
Setiap request harus menyertakan authorization.Authorization dapat berupa authotization token dan basic auth (mengunakan username dan password).  Data yang akan ditampilkan akan disaring(filter) berdasarkan akun yang sedang login atau berdasarkan token yang dimasukan. 
Berikut adalah tampilan request yang valid.
```
HTTP 200 OK
Allow: OPTIONS, GET
Content-Type: application/json
Vary: Accept

```

**Response**:
Response: Response diberikan dalam format JSON dengan ketentuan sebagai berikut.
- 403	Jika authorization token tidak valid atau tidak mengunakan authorization basic user dengan data akun yang cocok(matching). 
HTTP 403 Forbidden
Allow: GET, OPTIONS
Content-Type: application/json
Vary: Accept
```
{
    "detail": "Authentication credentials were not provided."
}
```

- 200	Response code tersebut akan dikembalikan jika authorization token atau basic user akun cocok dengan data yang terdapat pada database aplikasi. Selain mengembalikan response code 200, akan ditampilkan juga list produk yang telah dimasukan kedalam keranjang pengguna.
```
HTTP 200 OK
Allow: GET, OPTIONS
Content-Type: application/json
Vary: Accept

    {
        "id": 108,
        "user": 11,
        "products": [
            "018"
        ]
    }
]
```

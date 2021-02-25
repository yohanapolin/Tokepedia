# Profile List API

Fitur ini digunakan untuk melihat list informasi profile dari pengguna (user)
**URI Pattern**:
```
GET /customers/
```
**Request Requirements**:
Sebelum melakukan *request* user harus berada dalam kondisi logged in. 
Berikut ini adalah contoh sebuah request yang valid:
```
GET http://localhost/customers HTTP/1.1
Host: localhost
Connection: Keep-Alive
```

**Response**:
*Response* diberikan dalam format JSON dengan ketentuan sebagai berikut:
- Jika *credential* tidak valid, maka akan dikembalikan pesan kesalahan (403). Sebaliknya (200), ketika *credential* valid maka informasi yang akan dikembalikan adalah semua data profile yang tersimpan.

Berikut ini adalah contoh *response* yang diberikan ketika proses request berhasil.
```
HTTP 200 OK
Allow: OPTIONS, GET
Content-Type: application/json
Vary: Accept

[
    {
        "id": 1,
        "name": "Jennie Simatupang",
        "birth": "2000-09-24",
        "email": "jenniebaik@gmail.com",
        "address": "Tebing Tinggi, Sumatera Utara",
        "phone_number": "081233127865"
    },
    {
        "id": 2,
        "name": "Letare Aiglien",
        "birth": "2000-06-30",
        "email": "letareStward@gmail.com",
        "address": "Tigaras, Simalungun",
        "phone_number": "082275649908"
    },
    {
        "id": 3,
        "name": "Wahuna Lumban Gaol",
        "birth": "2000-09-12",
        "email": "wahunapie@gmail.com",
        "address": "Tarutung, Tapanuli Utara",
        "phone_number": "081222653987"
    }
]

```

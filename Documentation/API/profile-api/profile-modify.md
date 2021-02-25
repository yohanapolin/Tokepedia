# Profile Modify API

Fitur ini dapat digunakan untuk mengubah detail informasi profile dari pengguna (user). Detil yang dapat dimodifikasi antara lain name, birth, address, phone dan email

**URI Pattern**:
```
PATCH /customers/{id}/edit-profile  
```
**Request Requirements**:
Setiap request harus menggunakan credential authentication dan menyertakan parameter (user id) dari profile yang ingin dimodifikasi dan sebuah payload dalam format JSON.  
Berikut ini adalah contoh sebuah request yang valid:
```
HTTP 405 Method Not Allowed
Allow: PATCH, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "detail": "Method \"GET\" not allowed."
}

Media type:
application/json
Content:
    {
        "id": 1,
        "name": "Jennie Simatupang",
        "birth": "2000-09-24",
        "email": "jenniebaik@gmail.com",
        "address": "Institut Teknologi Del",
        "phone_number": "081233127865"
    },

```

**Response**:
*Response* diberikan dalam format JSON dengan ketentuan sebagai berikut:
- Jika *credential* sebagai admin tidak valid, maka akan dikembalikan pesan kesalahan (403). Jika *authorization credential* dan *id user* yang dimasukkan valid menunjukkan bahwa request berhasil diproses dan menampilkan pesan (200)
Berikut ini adalah contoh *response* yang diberikan ketika *credential* dan *id user* yang diberikan valid.
```
HTTP 200 OK
Allow: OPTIONS, PATCH
Content-Type: application/json
Vary: Accept

   {
        "id": 1,
        "name": "Jennie Simatupang",
        "birth": "2000-09-24",
        "email": "jenniebaik@gmail.com",
        "address": "Institut Teknologi Del",
        "phone_number": "081233127865"
    }

```

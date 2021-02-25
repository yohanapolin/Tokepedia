# Add Address API

Fitur ini dapat digunakan untuk menambah alamat baru dari pengguna (user). Alamat yang ditambahkan dapat berjumlah lebih dari satu untuk setiap pengguna. 

**URI Pattern**:
```
POST /customers/{id}/add-address
```
**Request Requirements**:
Setiap request harus menyertakan *id user* yang valid yang telah terdaftar di database. 
Berikut ini adalah contoh sebuah request yang valid:
```
HTTP 405 Method Not Allowed
Allow: OPTIONS, POST
Content-Type: application/json
Vary: Accept

{
    "detail": "Method \"GET\" not allowed."
}

Media type:
application/json
Content:
{
    "address": "Institut Teknologi Del"
}


```

**Response**:
*Response* diberikan dalam format JSON dengan ketentuan sebagai berikut:
- Jika *id user*  tidak valid, maka akan dikembalikan pesan kesalahan (404). Sebaliknya (200), ketika data  valid maka informasi yang akan dikembalikan antara lain: *id*, *name* ,*birth*, *email*, *address* dan *phone number* .

Berikut ini adalah contoh *response* yang diberikan ketika *id user* yang diberikan valid.
```
HTTP 200 OK
Allow: OPTIONS, POST
Content-Type: application/json
Vary: Accept

{
    "id": 1,
    "name": "Jennie Baik Sekali",
    "birth": "2000-09-24",
    "email": "jenniebaik@gmail.com",
    "address": "Institut Teknologi Del",
    "phone_number": "081233127865"
}

```

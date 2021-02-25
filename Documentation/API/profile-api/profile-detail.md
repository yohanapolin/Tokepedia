# Profile Detail API

Fitur ini digunakan untuk melihat detail informasi profile dari pengguna (user). 
**URI Pattern**:
```
GET /customers/{id}/profile-data
```
**Request Requirements**:
Setiap request harus menggunakan credential authentication dan menyertakan parameter (user id) dari profile yang ingin didapatkan detail informasinya. 

**Response**:
*Response* diberikan dalam format JSON dengan ketentuan sebagai berikut:
- Jika *credential* tidak valid, maka akan dikembalikan pesan kesalahan (403). 
- Sebaliknya (200), ketika *credential* valid dan id user tersimpan di database

Berikut ini adalah contoh *response* yang diberikan ketika *credential* dan *id user* yang diberikan valid.
```
HTTP 200 OK
Allow: OPTIONS, GET
Content-Type: application/json
Vary: Accept

    {
        "id": 3,
        "name": "Wahuna Lumban Gaol",
        "birth": "2000-09-12",
        "email": "wahunapie@gmail.com",
        "address": "Tarutung, Tapanuli Utara",
        "phone_number": "081222653987"
    }

```

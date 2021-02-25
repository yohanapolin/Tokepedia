# Update Transaction API

Fitur ini digunakan untuk memodifikasi sebuah transaksi berdasarkan id tertentu yang disertakan dalam bentuk parameter pada tokepedia.
**URI Pattern**:
```
PATCH /payment/{id}/edit-payment
```
**Request Requirements**:
Setiap request harus menyertakan credential(admin) dan payload dalam format JSON. Payload berisi data terkait transaksi, di antaranya payment_type dan amount. 
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
        "payment_type": 2,
        "amount": 3500000
    }

```

**Response**:
*Response* diberikan dalam format JSON dengan ketentuan sebagai berikut:
- Jika *credential* sebagai admin tidak valid, maka akan dikembalikan pesan kesalahan (403). Sebaliknya (200), ketika *credential* sebagai admin valid maka informasi yang akan dikembalikan antara lain: *payment_type* dan *amount*.

Berikut ini adalah contoh *response* yang diberikan ketika *credential* yang diberikan valid.
```
HTTP 200 OK
Allow: OPTIONS, PATCH
Content-Type: application/json
Vary: Accept

{
    "payment_type": 2,
    "amount": 3500000
}

```

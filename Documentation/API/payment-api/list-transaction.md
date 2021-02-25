# Transaction List API

Fitur ini digunakan untuk me-retrieve semua transaksi pada tokepedia. 
**URI Pattern**:
```
GET /payment/payment-list
```
**Request Requirements**:
Sebelum melakukan *request* user harus berada dalam kondisi logged in. 
Berikut ini adalah contoh sebuah request yang valid:
```
GET http://localhost/payment/payment-list HTTP/1.1
Host: localhost
Connection: Keep-Alive
```

**Response**:
*Response* diberikan dalam format JSON dengan ketentuan sebagai berikut:
- Jika *credential* tidak valid, maka akan dikembalikan pesan kesalahan (403). Sebaliknya (200), ketika *credential* valid maka informasi yang akan dikembalikan antara lain: *payment_type*, *amount*.

Berikut ini adalah contoh *response* yang diberikan ketika *credential* yang diberikan valid.
```
HTTP 200 OK
Allow: OPTIONS, GET
Content-Type: application/json
Vary: Accept

[
    {
        "payment_type": 1,
        "amount": 2000000
    },
    {
        "payment_type": 2,
        "amount": 2233232
    }
]

```

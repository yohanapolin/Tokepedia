# Detail Payment Type API

Fitur ini digunakan untuk me-retrieve sebuah tipe pembayaran dengan id tertentu yang disertakan dalam bentuk parameter pada tokepedia.
**URI Pattern**:
```
GET /payment/{id}/detail-payment-type
```
**Request Requirements**:
Sebelum melakukan *request* user harus berada dalam kondisi logged in. Berikut ini adalah contoh sebuah request yang valid:
```
GET http://localhost/payment/1/detail-payment-type HTTP/1.1
Host: localhost
Connection: Keep-Alive
```

**Response**:
*Response* diberikan dalam format JSON dengan ketentuan sebagai berikut:
- Jika *credential* tidak valid, maka akan dikembalikan pesan kesalahan (403). Sebaliknya (200), ketika *credential* valid maka informasi yang akan dikembalikan antara lain: *id*, *payment_name* dan *payment_method*.

Berikut ini adalah contoh *response* yang diberikan ketika *credential* yang diberikan valid.
```
HTTP 200 OK
Allow: OPTIONS, GET
Content-Type: application/json
Vary: Accept

{
    "id": 1,
    "payment_name": "ovo",
    "payment_method": "online"
}

```

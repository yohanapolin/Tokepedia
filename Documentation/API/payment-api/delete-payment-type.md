# Delete Payment Type API

Fitur ini digunakan untuk menghapus sebuah transaksi dengan id tertentu yang disertakan dalam bentuk parameter pada tokepedia. 
**URI Pattern**:
```
DELETE /payment/{id}/delete-payment-type
```
**Request Requirements**:
Sebelum melakukan *request* user harus berada dalam kondisi logged in. 
Berikut ini adalah contoh sebuah request yang valid:
```
HTTP 405 Method Not Allowed
Allow: DELETE, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "detail": "Method \"GET\" not allowed."
}
```

**Response**:
*Response* diberikan dalam format text dengan ketentuan sebagai berikut:
- Jika *credential* tidak valid, maka akan dikembalikan pesan kesalahan (403). Sebaliknya (200), ketika *credential* valid maka informasi yang akan dikembalikan ialah sebuah message berisi: "payment type succsesfully deleted!".

Berikut ini adalah contoh *response* yang diberikan ketika *credential* yang diberikan valid.
```
HTTP 200 OK
Allow: DELETE, OPTIONS
Content-Type: application/json
Vary: Accept

"payment type succsesfully deleted!"

```

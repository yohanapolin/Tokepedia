# Delete account of user Type API

Fitur ini digunakan untuk menghapus akun beserta dengan data-data dari seorang user dari database.
**URI Pattern**:
```
POST/users/{id}/remove
```
**Request Requirements**:
Akun hanya dapat dihapus oleh user yang telah terautentikasi.
Setelah sebuah akun telah dihapus maka pengguna tidak dapat lagi login dengan akun tersebut dikarenakan akun tersebut tidak lagi terdaftar di database.
Berikut adalah contoh sebuah request yang valid :
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
*Response* yang diberikan dalam bentuk format JSON dengan ketentuan :
- Jika credential tidak valid, maka akan dikembalikan pesan kesalahan (403). Sebaliknya (200), ketika credential valid maka informasi yang akan dikembalikan ialah sebuah message berisi: "USER WAS DELETED!".
Berikut ini adalah contoh *response* yang diberikan ketika credential yang diberikan valid.
```
HTTP 200 OK
Allow: GET, DELETE, OPTIONS
Content-Type: application/json
Vary: Accept

"USER WAS DELETED!"


```
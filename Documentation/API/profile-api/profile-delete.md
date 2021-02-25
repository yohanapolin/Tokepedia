# Profile Delete  API
Fitur ini dapat digunakan untuk menghapus detail informasi profile dari pengguna (user)
**URI Pattern**
```
DELETE /customers/{id}/delete-profile

```

**Request Requirements:**
Setiap request harus menggunakan *credential authentication* dan menyertakan parameter *user id* dari profile yang ingin dihapus.
 

**Response :**
•	Jika *authorization credential* tidak valid, maka akan dikembalikan pesan kesalahan (403).
•	Jika *authorization credential* dan *user id* yang dimasukkan valid menunjukkan bahwa request berhasil diproses dan menampilkan pesan (200)
.
```
HTTP 403 Forbidden
Allow: GET, DELETE, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "detail": "Authentication credentials were not provided."
}
```

- 200 Response : Repson yang akan ditampilkan jika berhasil melakukan penghapusan data profile.
```
HTTP 200 OK
Allow: GET, DELETE, OPTIONS
Content-Type: application/json
Vary: Accept

"PROFILE WAS DELETED!"
```
    
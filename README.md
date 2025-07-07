
# 📦 SQL Portofolio: Sistem Pemesanan Makanan

## 📌 Deskripsi
Portofolio ini merupakan simulasi dari sistem pemesanan makanan online sederhana yang biasa ditemukan pada aplikasi seperti ShopeeFood atau GoFood. Data dan skema ini dibuat untuk menunjukkan pemahaman SQL dalam konteks real-world, terutama dalam mengelola transaksi, pembayaran, dan validasi data sebagai bagian dari peran Quality Assurance (QA).

## 🧩 Tabel yang Digunakan

### 1. `pelanggan`
- Menyimpan data pelanggan yang melakukan pemesanan.

### 2. `menu`
- Menyimpan data menu makanan yang tersedia.

### 3. `pesanan`
- Menyimpan data pemesanan oleh pelanggan.

### 4. `detail_pesanan`
- Detail dari menu yang dipesan dalam satu transaksi.

### 5. `pembayaran`
- Data pembayaran untuk masing-masing pesanan.

## 🎯 Studi Kasus yang Dicontohkan

1. Hitung total belanja per pesanan.
2. Cek pesanan yang belum dibayar lunas.
3. Cari pesanan dengan estimasi pengantaran tertentu.
4. Validasi jumlah bayar vs total belanja.
5. Riwayat menu yang dipesan pelanggan tertentu.

## 🛠 Tools
- SQL Engine: SQLite (bisa diganti sesuai preferensi)
- Editor: DBeaver

## ✅ Status
Portofolio ini dapat dikembangkan dengan:
- Tabel kurir
- Status pesanan
- Notifikasi keterlambatan

Gunakan file ini untuk latihan SQL atau sebagai bahan portfolio QA.

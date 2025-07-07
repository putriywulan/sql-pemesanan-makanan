# 📦 SQL Portofolio: Sistem Pemesanan Makanan

## 📌 Deskripsi
Portofolio ini merupakan simulasi dari sistem pemesanan makanan online sederhana yang biasa ditemukan pada aplikasi seperti ShopeeFood atau GoFood. Data dan skema ini dibuat untuk menunjukkan pemahaman SQL dalam konteks real-world, terutama dalam mengelola transaksi, pembayaran, dan validasi data sebagai bagian dari peran Quality Assurance (QA).

## 🧩 Tabel yang Digunakan

### 1. `pelanggan`
Menyimpan data pelanggan yang melakukan pemesanan.
- `id`: ID unik
- `nama`: Nama pelanggan

### 2. `menu`
Menyimpan data menu makanan yang tersedia.
- `id`: ID unik menu
- `nama_menu`: Nama menu
- `harga`: Harga satuan menu

### 3. `pesanan`
Menyimpan data pemesanan oleh pelanggan.
- `id`: ID unik pemesanan
- `pelanggan_id`: Relasi ke pelanggan
- `tanggal_pesan`: Tanggal pesanan dibuat
- `estimasi_selesai`: Estimasi jam selesai pesanan

### 4. `detail_pesanan`
Detail dari menu yang dipesan dalam satu transaksi.
- `id`: ID unik
- `pesanan_id`: Relasi ke pemesanan
- `menu_id`: Relasi ke menu
- `jumlah`: Jumlah item yang dipesan

### 5. `pembayaran`
Data pembayaran untuk masing-masing pesanan.
- `id`: ID unik
- `pesanan_id`: Relasi ke pesanan
- `metode`: Transfer / COD
- `jumlah_bayar`: Jumlah uang yang dibayarkan
- `status`: Lunas / Belum Lunas

---

## 🎯 Studi Kasus yang Dicontohkan

1. **Hitung total belanja per pesanan** berdasarkan jumlah dan harga menu.
2. **Cek pesanan yang belum dibayar lunas**.
3. **Cari pesanan yang estimasi pengantarannya melebihi jam tertentu**.
4. **Validasi apakah jumlah yang dibayar sesuai dengan total belanja**.
5. **Lihat riwayat menu yang dipesan oleh pelanggan tertentu**.

---

## 🧪 Tujuan Pembelajaran
- Praktik `JOIN` antar banyak tabel
- Gunakan `GROUP BY`, `HAVING`, dan validasi data
- Simulasi real-world untuk QA dalam memverifikasi data

---

## 🛠 Tools
- SQL Engine: SQLite (bisa diganti sesuai preferensi)
- Editor: DBeaver

---

## ✅ Status
Portofolio ini dapat dikembangkan lagi dengan fitur seperti:
- Tabel kurir atau pengantar makanan
- Riwayat status pesanan (Diproses, Diantar, Selesai)
- Waktu aktual pengiriman
- Notifikasi keterlambatan

---

Silakan gunakan file `schema.sql` dan `query-latihan.sql` untuk uji coba langsung di DBeaver. Semoga bermanfaat untuk wawancara QA atau latihan SQL real project ✨


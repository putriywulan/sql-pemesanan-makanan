-- SCHEMA: Struktur Tabel

CREATE TABLE pelanggan (
  id INTEGER PRIMARY KEY,
  nama TEXT
);

CREATE TABLE menu (
  id INTEGER PRIMARY KEY,
  nama_menu TEXT,
  harga INTEGER
);

CREATE TABLE pesanan (
  id INTEGER PRIMARY KEY,
  pelanggan_id INTEGER,
  tanggal_pesan DATE,
  estimasi_selesai TIME,
  FOREIGN KEY (pelanggan_id) REFERENCES pelanggan(id)
);

CREATE TABLE detail_pesanan (
  id INTEGER PRIMARY KEY,
  pesanan_id INTEGER,
  menu_id INTEGER,
  jumlah INTEGER,
  FOREIGN KEY (pesanan_id) REFERENCES pesanan(id),
  FOREIGN KEY (menu_id) REFERENCES menu(id)
);

CREATE TABLE pembayaran (
  id INTEGER PRIMARY KEY,
  pesanan_id INTEGER,
  metode TEXT,
  jumlah_bayar INTEGER,
  status TEXT,
  FOREIGN KEY (pesanan_id) REFERENCES pesanan(id)
);

-- INSERT DATA

INSERT INTO pelanggan VALUES (1, 'Putri'), (2, 'Andi');

INSERT INTO menu VALUES 
(1, 'Nasi Goreng', 20000),
(2, 'Ayam Geprek', 18000),
(3, 'Es Teh Manis', 5000);

INSERT INTO pesanan VALUES 
(1, 1, '2024-06-01', '12:30'),
(2, 2, '2024-06-02', '13:15');

INSERT INTO detail_pesanan VALUES 
(1, 1, 1, 2),  -- Putri pesan 2 Nasi Goreng
(2, 1, 3, 2),  -- Putri pesan 2 Es Teh
(3, 2, 2, 1);  -- Andi pesan 1 Ayam Geprek

INSERT INTO pembayaran VALUES 
(1, 1, 'Transfer', 50000, 'Lunas'),
(2, 2, 'COD', 18000, 'Belum Lunas');

-- QUERY PORTOFOLIO

-- 1. Total harga tiap pesanan
SELECT p.id AS id_pesanan, pel.nama, SUM(m.harga * d.jumlah) AS total_harga
FROM pesanan p
JOIN pelanggan pel ON p.pelanggan_id = pel.id
JOIN detail_pesanan d ON p.id = d.pesanan_id
JOIN menu m ON d.menu_id = m.id
GROUP BY p.id, pel.nama;

-- 2. Semua menu yang dipesan oleh Putri
SELECT m.nama_menu, d.jumlah
FROM pelanggan pel
JOIN pesanan p ON pel.id = p.pelanggan_id
JOIN detail_pesanan d ON p.id = d.pesanan_id
JOIN menu m ON d.menu_id = m.id
WHERE pel.nama = 'Putri';

-- 3. Pesanan yang belum lunas
SELECT pel.nama, p.id AS pesanan_id, bayar.status
FROM pembayaran bayar
JOIN pesanan p ON bayar.pesanan_id = p.id
JOIN pelanggan pel ON p.pelanggan_id = pel.id
WHERE bayar.status = 'Belum Lunas';

-- 4. Pesanan dengan estimasi selesai lewat dari 13:00
SELECT pel.nama, p.id AS pesanan_id, p.estimasi_selesai
FROM pesanan p
JOIN pelanggan pel ON p.pelanggan_id = pel.id
WHERE p.estimasi_selesai > '13:00';

-- 5. Validasi: jumlah bayar kurang dari total belanja
SELECT pel.nama, bayar.jumlah_bayar, SUM(m.harga * d.jumlah) AS total_harusnya
FROM pembayaran bayar
JOIN pesanan p ON bayar.pesanan_id = p.id
JOIN pelanggan pel ON p.pelanggan_id = pel.id
JOIN detail_pesanan d ON p.id = d.pesanan_id
JOIN menu m ON d.menu_id = m.id
GROUP BY pel.nama, bayar.jumlah_bayar
HAVING bayar.jumlah_bayar < SUM(m.harga * d.jumlah);

// kasir.dart
import 'transaksi.dart';

class Kasir {
  String nama;
  List<Transaksi> transaksiList = [];

  Kasir({required this.nama});

  // Menambahkan transaksi ke dalam kasir
  void tambahTransaksi(Transaksi transaksi) {
    transaksiList.add(transaksi);
  }

 void laporanPenjualan() {
  Map<String, int> produkTerbanyak = {};
  double totalPenjualan = 0;

  // Iterasi untuk setiap transaksi
  for (var transaksi in transaksiList) {
    totalPenjualan += transaksi.total;

    // Iterasi untuk setiap produk yang dibeli dalam transaksi
    for (var item in transaksi.items) {
      String namaProduk = item['produk'].nama;

      // Pastikan jumlah produk adalah tipe int
      int jumlah = item['jumlah'] is int ? item['jumlah'] : 0;

      // Jika produk sudah ada di produkTerbanyak, tambahkan jumlahnya
      if (produkTerbanyak.containsKey(namaProduk)) {
        produkTerbanyak[namaProduk] = produkTerbanyak[namaProduk]! + jumlah;
      } else {
        // Jika produk belum ada, inisialisasi dengan jumlah produk
        produkTerbanyak[namaProduk] = jumlah;
      }
    }
  }

  // Menampilkan laporan penjualan
  print('--- LAPORAN PENJUALAN ---');
  print('Total Transaksi: ${transaksiList.length}');
  print('Produk Terbanyak Dibeli:');
  
  // Menampilkan produk yang paling banyak dibeli
  produkTerbanyak.forEach((produk, jumlah) {
    print('$produk - $jumlah');
  });

  print('Total Penjualan: \Rp.${totalPenjualan}');
  print('-------------------------');
}

}

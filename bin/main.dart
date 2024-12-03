import 'dart:io';
import '../lib/produk.dart';
import '../lib/keranjang.dart';
import '../lib/transaksi.dart';
import '../lib/kasir.dart';

void main() {
  // Meminta input nama kasir
  stdout.write('Masukkan nama kasir: ');
  String namaKasir = stdin.readLineSync()!;

  // Inisialisasi produk
  Produk produk1 = Produk(nama: 'kaos', harga: 50000, stok: 40);
  Produk produk2 = Produk(nama: 'hoodie', harga: 100000, stok: 50);
  Produk produk3 = Produk(nama: 'topi', harga: 20000, stok: 10);

  // Membuat objek Kasir berdasarkan nama kasir yang diinput
  Kasir kasir = Kasir(nama: namaKasir);

  // Keranjang belanja
  Keranjang keranjang = Keranjang();

  while (true) {
    // Menampilkan menu pilihan
    print('--- Toko thrifting ---');
    print('1. Tambah Produk ke Keranjang');
    print('2. Hapus Produk dari Keranjang');
    print('3. Hitung Total Belanja');
    print('4. Cetak Struk');
    print('5. Laporan Penjualan');
    print('6. Keluar');
    stdout.write('Pilih fitur (1-6): ');
    
    int pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        // Menambah produk ke keranjang
        print('Pilih produk yang ingin ditambahkan:');
        print('1. kaos (Stok: ${produk1.stok})');
        print('2. hoodie (Stok: ${produk2.stok})');
        print('3. topi (Stok: ${produk3.stok})');
        stdout.write('Pilih produk (1-3): ');
        int produkPilihan = int.parse(stdin.readLineSync()!);

        // Meminta jumlah produk
        stdout.write('Masukkan jumlah produk yang ingin ditambahkan: ');
        int jumlah = int.parse(stdin.readLineSync()!);

        // Cek stok produk dan tambahkan ke keranjang
        switch (produkPilihan) {
          case 1:
            if (jumlah <= produk1.stok) {
              keranjang.tambahProduk(produk1, jumlah);
              produk1.stok -= jumlah; // Mengurangi stok produk setelah ditambahkan ke keranjang
              print('$jumlah kaos berhasil ditambahkan ke keranjang.');
            } else {
              print('Stok kaos tidak cukup.');
            }
            break;
          case 2:
            if (jumlah <= produk2.stok) {
              keranjang.tambahProduk(produk2, jumlah);
              produk2.stok -= jumlah; // Mengurangi stok produk setelah ditambahkan ke keranjang
              print('$jumlah hoodie berhasil ditambahkan ke keranjang.');
            } else {
              print('Stok hoodie tidak cukup.');
            }
            break;
          case 3:
            if (jumlah <= produk3.stok) {
              keranjang.tambahProduk(produk3, jumlah);
              produk3.stok -= jumlah; // Mengurangi stok produk setelah ditambahkan ke keranjang
              print('$jumlah topi berhasil ditambahkan ke keranjang.');
            } else {
              print('Stok topi tidak cukup.');
            }
            break;
          default:
            print('Pilihan tidak valid.');
        }
        break;
      
      case 2:
        // Menghapus produk dari keranjang
        print('Pilih produk yang ingin dihapus:');
        print('1. kaos');
        print('2. hoodie');
        print('3. topi');
        stdout.write('Pilih produk (1-3): ');
        int produkHapus = int.parse(stdin.readLineSync()!);

        switch (produkHapus) {
          case 1:
            keranjang.hapusProduk(produk1);
            break;
          case 2:
            keranjang.hapusProduk(produk2);
            break;
          case 3:
            keranjang.hapusProduk(produk3);
            break;
          default:
            print('Pilihan tidak valid.');
        }
        break;

      case 3:
        // Menghitung total belanja
        double total = keranjang.hitungTotal();
        print('Total Belanja: \Rp.${total}');
        break;

      case 4:
        // Mencetak struk
        double totalBelanja = keranjang.hitungTotal();
        Transaksi transaksi = Transaksi(tanggal: DateTime.now(), items: keranjang.produkList, total: totalBelanja);
        transaksi.cetakStruk();
        kasir.tambahTransaksi(transaksi);
        break;

      case 5:
        // Menampilkan laporan penjualan
        kasir.laporanPenjualan();
        break;

      case 6:
        // Keluar dari aplikasi
        print('Terima kasih telah menggunakan aplikasi POS.');
        return;

      default:
        print('Pilihan tidak valid.');
    }
  }
}

// produk.dart
class Produk {
  String nama;
  double harga;
  int stok;

  Produk({required this.nama, required this.harga, required this.stok});

  // Fungsi untuk mengurangi stok setelah pembelian
  void kurangiStok(int jumlah) {
    if (stok >= jumlah) {
      stok -= jumlah;
    } else {
      print('Stok tidak cukup');
    }
  }
}

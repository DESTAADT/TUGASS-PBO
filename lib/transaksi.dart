// transaksi.dart


class Transaksi {
  DateTime tanggal;
  List<Map<String, dynamic>> items;
  double total;

  Transaksi({required this.tanggal, required this.items, required this.total});

  // Mencetak struk
  void cetakStruk() {
    print('--- STRUK PEMBELIAN ---');
    print('Tanggal: ${tanggal}');
    for (var item in items) {
      print('${item['produk'].nama} - ${item['jumlah']} x \Rp.${item['produk'].harga} = \Rp.${item['produk'].harga * item['jumlah']}');
    }
    print('Total: \Rp.${total}');
    print('-----------------------');
  }
}

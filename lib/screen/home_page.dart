import 'package:flutter/material.dart'; 
import 'package:fakestore_novalsaputra/model/produk_model.dart';
import 'package:fakestore_novalsaputra/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ApiServices _apiServices = ApiServices();

  List<Products> _allproducts = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

    final List<Map<String, Products>> allProducts =
          await _apiServices.getAllProducts();
    

      setState(() {
        _allproducts = allProducts.map((e) => Products.fromJson(e)).toList();
        _isLoading = false;
      });
    } catch (e) {

      setState(() {
        _isLoading = false;
        _errorMessage = "Failed to load products : $e";
      }); 
      print("Error loading products : $e");
    }
  }


}
          
// 1. Jelaskan alur data dari ApiService hingga tampil di ListView.
// 1. API Service (Networking)
// Request: Aplikasi membuat permintaan (request) ke server API, biasanya menggunakan library networking seperti Retrofit atau Volley.
// Response: Server merespons dengan data mentah, umumnya dalam format JSON.
// Callback: Library networking mengelola respons asinkron (asynchronous), memastikan UI tidak beku (freeze) selama proses pengambilan data. 
// Stack Overflow
// Stack Overflow
//  +2
// 2. Data Parsing (Model)
// Data JSON mentah dari API diparsing (diuraikan) menjadi objek Java/Kotlin (Model Class) menggunakan library seperti GSON atau Moshi.
// Data yang diparsing ini kemudian disimpan ke dalam sebuah koleksi, biasanya ArrayList. 
// Stack Overflow
// Stack Overflow
//  +1
// 3. Data Binding (Adapter)
// Adapter: Ini adalah jembatan antara data (ArrayList) dan ListView.
// Adapter mengambil data dari ArrayList dan mengubah setiap objek data menjadi sebuah tampilan (View/Layout) baris.
// Adapter umum yang digunakan adalah ArrayAdapter atau BaseAdapter. 
// Arif Laksito
// Arif Laksito
//  +3
// 4. Tampilan (ListView)
// Set Adapter: Adapter yang sudah diisi data dipasang ke ListView menggunakan method setAdapter().
// Rendering: ListView menampilkan data secara vertikal/horizontal dan mengatur scrolling.
// Tampilan Selesai: Data API kini tampil di UI aplikasi. 
// Stack Overflow
// Stack Overflow
//  +3

// 2.Mengapa kita perlu memisahkan list data asli dan list data yang ditampilkan saat melakukan
// filter?
// Menjaga Integritas Data Asli (Data Utama): Data asli tidak boleh diubah atau dihapus saat proses penyaringan berlangsung. Jika filter langsung mengubah list asli, data yang tidak memenuhi kriteria akan hilang, sehingga sulit atau tidak mungkin untuk menampilkan kembali data secara lengkap tanpa memuat ulang data dari sumbernya.




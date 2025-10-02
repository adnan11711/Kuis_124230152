import 'package:flutter/material.dart';
import 'buku_data.dart';
import 'package:url_launcher/url_launcher.dart';

class Buku_listDetailPage extends StatelessWidget {
  final Book buku;
  const Buku_listDetailPage({super.key, required this.buku});

Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
      }
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(buku.title),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            if (buku.imageUrls.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                        buku.imageUrls.isNotEmpty
                        ? buku.imageUrls[0]
                        :'https://docs.flutter.dev/',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.broken_image, size: 50));
                        },
                      ),
              )
            else
              const Icon(Icons.broken_image, size: 100),

            const SizedBox(height: 16),
            
            Text(
              buku.author,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, 
            ),

            const SizedBox(height: 6),

            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                buku.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.deepOrange,
                ),
                textAlign: TextAlign.center, 
              ),
            ),

            const SizedBox(height: 16),

            
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      " Judul: ${buku.title}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 16, 13, 12),
                      ),
                      textAlign: TextAlign.center, 
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Deskripsi: ${buku.description}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 16, 13, 12),
                      ),
                      textAlign: TextAlign.center, 
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Penulis: ${buku.author} ",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 16, 13, 12),
                      ),
                      textAlign: TextAlign.center, 
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Harga:  ${buku.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 16, 13, 12),
                      ),
                      textAlign: TextAlign.center, 
                    ),
                     const SizedBox(height: 15),
               ElevatedButton.icon(
              onPressed: () => _launchUrl(buku.officialUrl),
              icon: const Icon(Icons.link),
              label: const Text("Buka Link Resmi"),
            ),
            const SizedBox(height:20),

            const SizedBox(height: 15),
               ElevatedButton.icon(
              onPressed: () => _launchUrl(buku.officialUrl),
              icon: const Icon(Icons.link),
              label: const Text("Beli Buku"),
            ),
            const SizedBox(height:20)
    
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text("Kembali"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

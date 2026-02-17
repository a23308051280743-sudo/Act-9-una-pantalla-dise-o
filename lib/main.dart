import 'package:flutter/material.dart';

void main() => runApp(const HotelApp());

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDF8F2), // Beige muy claro
      ),
      home: const RoomDetailScreen(),
    );
  }
}

class RoomDetailScreen extends StatelessWidget {
  const RoomDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculamos el cuarto de la pantalla para la imagen
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight = screenHeight * 0.25;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Imagen que ocupa 1/4 de la pantalla
            Stack(
              children: [
                Container(
                  height: imageHeight,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1590490360182-c33d57733427?q=80&w=1000'), // Imagen de Suite
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Texto "Suite Fam" en la parte inferior izquierda de la imagen
                Positioned(
                  bottom: 10,
                  left: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      'Suite Fam',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Texto "Classical house" fuera de la imagen
                  const Text(
                    'Classical house',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D2B1F), // Café oscuro
                      fontFamily: 'Serif', 
                    ),
                  ),
                  const SizedBox(height: 25),

                  // 3. Apartado Photos
                  const Text(
                    'Photos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5D4037),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // 4. Grid de 4 fotos
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: List.generate(4, (index) => Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7DCCF),
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1566665797739-1674de7a421a?q=80&w=200'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                  ),
                  const SizedBox(height: 30),

                  // 5. Detalles y espacio para reseña
                  const Text(
                    'Detalles',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3D2B1F),
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Líneas para la reseña
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFFE7DCCF)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(3, (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Divider(color: Colors.grey[300], thickness: 1),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// // Model untuk produk
// // Model untuk produk
// class Product {
//   final String id;
//   final String name;
//   final String code;
//   final String specification;
//   final String category;
//   final int year;
//   final String status;
//   final int quantity;
//   final double price;
//   final String imageUrl;

//   Product({
//     required this.id,
//     required this.name,
//     required this.code,
//     required this.specification,
//     required this.category,
//     required this.year,
//     required this.status,
//     required this.quantity,
//     required this.price,
//     required this.imageUrl,
//   });
// }

// // Data produk dummy dengan gambar lokal
// final List<Product> products = [
//   Product(
//     id: 'B001',
//     name: 'Router WiFi',
//     code: 'RTR001',
//     specification: '300 Mbps, dual-band',
//     category: 'Networking',
//     year: 2023,
//     status: 'Available',
//     quantity: 10,
//     price: 100.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B002',
//     name: 'Access Point',
//     code: 'AP001',
//     specification: 'High gain antenna',
//     category: 'Networking',
//     year: 2022,
//     status: 'Available',
//     quantity: 5,
//     price: 200.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B003',
//     name: 'Modem Fiber',
//     code: 'MDM001',
//     specification: 'Gigabit Ethernet',
//     category: 'Networking',
//     year: 2021,
//     status: 'Available',
//     quantity: 3,
//     price: 150.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B004',
//     name: 'Switch Ethernet',
//     code: 'SWT001',
//     specification: '24 ports, managed',
//     category: 'Networking',
//     year: 2023,
//     status: 'Available',
//     quantity: 2,
//     price: 250.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B005',
//     name: 'Antena Eksternal',
//     code: 'ANT001',
//     specification: 'Outdoor, 5 dBi',
//     category: 'Networking',
//     year: 2022,
//     status: 'Available',
//     quantity: 8,
//     price: 300.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B006',
//     name: 'Laptop',
//     code: 'LPT001',
//     specification: 'Core i7, 16GB RAM, SSD 512GB',
//     category: 'Komputer',
//     year: 2023,
//     status: 'Available',
//     quantity: 15,
//     price: 180.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B007',
//     name: 'Printer Laserjet',
//     code: 'PRT001',
//     specification: 'Monochrome, A4',
//     category: 'Perangkat Cetak',
//     year: 2022,
//     status: 'Available',
//     quantity: 7,
//     price: 220.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B008',
//     name: 'Monitor LED',
//     code: 'MNT001',
//     specification: '27 inch, 4K resolution',
//     category: 'Monitor',
//     year: 2023,
//     status: 'Available',
//     quantity: 12,
//     price: 170.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B009',
//     name: 'Keyboard Mechanikal',
//     code: 'KBD001',
//     specification: 'RGB backlight',
//     category: 'Aksesori Komputer',
//     year: 2022,
//     status: 'Available',
//     quantity: 20,
//     price: 130.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B010',
//     name: 'Mouse Gaming',
//     code: 'MS001',
//     specification: 'DPI adjustable, programmable buttons',
//     category: 'Aksesori Komputer',
//     year: 2021,
//     status: 'Available',
//     quantity: 18,
//     price: 280.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B011',
//     name: 'Smartphone',
//     code: 'SPH001',
//     specification: '5G, 128GB storage',
//     category: 'Gadget',
//     year: 2023,
//     status: 'Available',
//     quantity: 25,
//     price: 300.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B012',
//     name: 'Tablet',
//     code: 'TBL001',
//     specification: '10 inch, Android OS',
//     category: 'Gadget',
//     year: 2022,
//     status: 'Available',
//     quantity: 10,
//     price: 250.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B013',
//     name: 'Headset Gaming',
//     code: 'HST001',
//     specification: '7.1 surround sound',
//     category: 'Aksesori Audio',
//     year: 2021,
//     status: 'Available',
//     quantity: 15,
//     price: 150.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B014',
//     name: 'Webcam HD',
//     code: 'WBC001',
//     specification: '1080p resolution',
//     category: 'Perangkat Video',
//     year: 2022,
//     status: 'Available',
//     quantity: 9,
//     price: 120.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B015',
//     name: 'Speaker Bluetooth',
//     code: 'SPK001',
//     specification: 'Portable, waterproof',
//     category: 'Aksesori Audio',
//     year: 2023,
//     status: 'Available',
//     quantity: 6,
//     price: 200.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B016',
//     name: 'Power Bank',
//     code: 'PWB001',
//     specification: '20000 mAh, fast charging',
//     category: 'Aksesori Gadget',
//     year: 2022,
//     status: 'Available',
//     quantity: 20,
//     price: 80.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B017',
//     name: 'External Hard Drive',
//     code: 'EHD001',
//     specification: '2TB storage, USB 3.0',
//     category: 'Storage',
//     year: 2021,
//     status: 'Available',
//     quantity: 7,
//     price: 220.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
//   Product(
//     id: 'B018',
//     name: 'Wireless Mouse',
//     code: 'WMS001',
//     specification: 'Bluetooth connection',
//     category: 'Aksesori Komputer',
//     year: 2023,
//     status: 'Available',
//     quantity: 14,
//     price: 75.0, // Sesuaikan harga jika diperlukan
//     imageUrl: 'assets/images/product.jpg', // Gambar lokal
//   ),
// ];

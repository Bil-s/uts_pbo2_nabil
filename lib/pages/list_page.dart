import 'package:flutter/material.dart';
import 'detail_materi_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<bool> checked = List.generate(7, (_) => false);

  final List<Map<String, dynamic>> materiList = [
    {
      "title": "Pertemuan 1",
      "materi":
          "Pengenalan Flutter & Widget Dasar\n\n"
          "Flutter adalah framework UI open-source dari Google.\n\n"
          "Widget dasar:\n"
          "• Scaffold\n"
          "• Column\n"
          "• Row\n"
          "• Container",
      "example": Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.blue,
            child: const Text(
              "Contoh Container",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.yellow),
              SizedBox(width: 8),
              Text(
                "Contoh Row",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    },

    {
      "title": "Pertemuan 2",
      "materi":
          "StatefulWidget & StatelessWidget\n\n"
          "StatefulWidget digunakan untuk widget yang bisa berubah menggunakan setState().",
      "example": const CounterExample(),
    },

    {
      "title": "Pertemuan 3",
      "materi":
          "Navigation & Perpindahan Halaman\n\n"
          "• Navigator.push() — membuka halaman baru\n"
          "• Navigator.pop() — kembali ke halaman sebelumnya\n\n"
          "Navigator digunakan untuk perpindahan halaman pada Flutter.",
      "example": const NavigatorExample(),
    },

    {
      "title": "Pertemuan 4",
      "materi":
          "Toast dan Alert Dialog Flutter.\n\n"
          "Digunakan untuk menampilkan popup dan notifikasi.",
      "example": const DialogExample(),
    },

    {
      "title": "Pertemuan 5",
      "materi":
          "ListView pada Flutter.\n\n"
          "ListView digunakan untuk membuat daftar item.",
      "example": SizedBox(
        height: 150,
        child: ListView(
          children: const [
            ListTile(
              leading: Icon(Icons.book, color: Colors.blue),
              title: Text(
                "Item 1",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.orange),
              title: Text(
                "Item 2",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    },

    {
      "title": "Pertemuan 6",
      "materi":
          "Checkbox Flutter.\n\n"
          "Checkbox digunakan untuk pilihan true / false.",
      "example": const CheckboxExample(),
    },

    {
      "title": "Pertemuan 7",
      "materi":
          "RadioButton Flutter.\n\n"
          "RadioButton digunakan untuk memilih satu pilihan.",
      "example": const RadioExample(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    double progress = checked.where((e) => e).length / 7;

    return SafeArea(
      child: Column(
        children: [

          // HEADER PROGRESS
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF2563EB),
                  Color(0xFF7C3AED),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Progress Belajar",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${(progress * 100).toInt()}%",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                CircularProgressIndicator(
                  value: progress,
                  color: Colors.white,
                  backgroundColor: Colors.white24,
                ),
              ],
            ),
          ),

          // LIST MATERI
          Expanded(
            child: ListView.builder(
              itemCount: materiList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailMateriPage(
                          title: materiList[index]['title'],
                          materi: materiList[index]['materi'],
                          example: materiList[index]['example'],
                        ),
                      ),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: checked[index]
                            ? const Color(0xFF14532D)
                            : const Color(0xFF1E293B),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          materiList[index]['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          checked[index]
                              ? "Sudah dipelajari"
                              : "Tap untuk membuka materi",
                          style: const TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                        trailing: Checkbox(
                          value: checked[index],
                          activeColor: Colors.green,
                          onChanged: (val) {
                            setState(() {
                              checked[index] = val!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// =======================
// CONTOH OUTPUT WIDGET
// =======================

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$count",
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: const Text("Tambah"),
        ),
      ],
    );
  }
}

class NavigatorExample extends StatelessWidget {
  const NavigatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        icon: const Icon(Icons.open_in_new),
        label: const Text("Buka Halaman Baru"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ContohHalamanBaru(),
            ),
          );
        },
      ),
    );
  }
}

class ContohHalamanBaru extends StatelessWidget {
  const ContohHalamanBaru({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Text("Halaman Baru"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.rocket_launch,
              color: Colors.blue,
              size: 90,
            ),

            const SizedBox(height: 20),

            const Text(
              "Berhasil pindah halaman 🚀",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Ini contoh penggunaan Navigator.push()",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              label: const Text("Kembali"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      activeColor: Colors.green,
      title: const Text(
        "Checkbox Flutter",
        style: TextStyle(color: Colors.white),
      ),
      onChanged: (v) {
        setState(() {
          value = v!;
        });
      },
    );
  }
}

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  String selected = "Laki-laki";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text(
            "Laki-laki",
            style: TextStyle(color: Colors.white),
          ),
          value: "Laki-laki",
          groupValue: selected,
          onChanged: (v) {
            setState(() {
              selected = v!;
            });
          },
        ),
        RadioListTile(
          title: const Text(
            "Perempuan",
            style: TextStyle(color: Colors.white),
          ),
          value: "Perempuan",
          groupValue: selected,
          onChanged: (v) {
            setState(() {
              selected = v!;
            });
          },
        ),
      ],
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Alert Dialog"),
            content: const Text("Ini contoh dialog Flutter"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      },
      child: const Text("Tampilkan Dialog"),
    );
  }
}
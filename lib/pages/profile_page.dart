import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String nama = "Muhamad Nabil Priatma";
  String kelas = "04SIFP009";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [

            // 🔥 HEADER PROFILE
            Container(
              width: double.infinity,

              padding: const EdgeInsets.only(
                top: 40,
                bottom: 30,
              ),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF2563EB),
                    Color(0xFF7C3AED),
                  ],
                ),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(
                children: [

                  // 🔥 FOTO PROFILE
                  Hero(
                    tag: "profile",

                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                          )
                        ],
                      ),

                      child: const CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage("assets/me2.jpg"),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 🔥 NAMA DINAMIS
                  Text(
                    nama,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "Mahasiswa Sistem Informasi",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔥 BUTTON EDIT PROFILE
                  ElevatedButton.icon(
                    onPressed: () {

                      TextEditingController namaController =
                          TextEditingController(text: nama);

                      TextEditingController kelasController =
                          TextEditingController(text: kelas);

                      showDialog(
                        context: context,

                        builder: (context) {
                          return AlertDialog(
                            backgroundColor:
                                const Color(0xFF1E293B),

                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),

                            title: const Text(
                              "Edit Profile",
                              style:
                                  TextStyle(color: Colors.white),
                            ),

                            content: Column(
                              mainAxisSize: MainAxisSize.min,

                              children: [

                                // 🔥 INPUT NAMA
                                TextField(
                                  controller: namaController,

                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),

                                  decoration: InputDecoration(
                                    labelText: "Nama",

                                    labelStyle:
                                        const TextStyle(
                                      color: Colors.white70,
                                    ),

                                    enabledBorder:
                                        OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15),

                                      borderSide:
                                          const BorderSide(
                                        color: Colors.white24,
                                      ),
                                    ),

                                    focusedBorder:
                                        OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15),

                                      borderSide:
                                          const BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 16),

                                // 🔥 INPUT KELAS
                                TextField(
                                  controller: kelasController,

                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),

                                  decoration: InputDecoration(
                                    labelText: "Kelas",

                                    labelStyle:
                                        const TextStyle(
                                      color: Colors.white70,
                                    ),

                                    enabledBorder:
                                        OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15),

                                      borderSide:
                                          const BorderSide(
                                        color: Colors.white24,
                                      ),
                                    ),

                                    focusedBorder:
                                        OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(15),

                                      borderSide:
                                          const BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            actions: [

                              // 🔥 BUTTON BATAL
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },

                                child: const Text(
                                  "Batal",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),

                              // 🔥 BUTTON SIMPAN
                              ElevatedButton(
                                onPressed: () {

                                  setState(() {
                                    nama = namaController.text;
                                    kelas = kelasController.text;
                                  });

                                  Navigator.pop(context);

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Profile berhasil diperbarui 🚀",
                                      ),
                                    ),
                                  );
                                },

                                child: const Text("Simpan"),
                              ),
                            ],
                          );
                        },
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,

                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                    ),

                    icon: const Icon(Icons.edit),

                    label: const Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🔥 INFO CARD
            _infoCard(
              Icons.badge,
              "NIM",
              "241011700300",
            ),

            _infoCard(
              Icons.class_,
              "Kelas",
              kelas,
            ),

            _infoCard(
              Icons.school,
              "Prodi",
              "Sistem Informasi",
            ),

            _infoCard(
              Icons.email,
              "Email",
              "mnabilpriatma@gmail.com",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 🔥 CARD INFO MODERN
  static Widget _infoCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Material(
      color: Colors.transparent,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),

        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),

          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
            ),
          ],
        ),

        child: ListTile(
          contentPadding: const EdgeInsets.all(14),

          leading: CircleAvatar(
            backgroundColor: Colors.blue,

            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),

          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),

          subtitle: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white38,
            size: 18,
          ),
        ),
      ),
    );
  }
}
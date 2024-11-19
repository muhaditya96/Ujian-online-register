import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String? selectedExamType;
  bool isAgreed = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Ujian"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                "Isi Data Ujian Anda",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 20),

              // Nama Input
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Nama",
                  labelStyle: const TextStyle(color: Colors.deepPurple),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Mata Pelajaran Input
              TextField(
                controller: subjectController,
                decoration: InputDecoration(
                  labelText: "Mata Pelajaran",
                  labelStyle: const TextStyle(color: Colors.deepPurple),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Dropdown Button (Jenis Ujian)
              DropdownButtonFormField<String>(
                value: selectedExamType,
                hint: const Text("Pilih Jenis Ujian"),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: ["UTS", "UAS", "Quiz"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedExamType = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Checkbox for Agreement
              Row(
                children: [
                  Checkbox(
                    value: isAgreed,
                    onChanged: (value) {
                      setState(() {
                        isAgreed = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "Saya siap mengikuti ujian.",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ElevatedButton with custom styling
             ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.deepPurple, // Background color
    foregroundColor: Colors.white, // Text color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  onPressed: isAgreed
      ? () {
          final summary =
              "Nama: ${nameController.text}\n"
              "Mata Pelajaran: ${subjectController.text}\n"
              "Jenis Ujian: $selectedExamType";
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Ringkasan Data"),
              content: Text(summary),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      : null,
  child: const Text("Tampilkan Ringkasan"),
)
,
            ],
          ),
        ),
      ),
    );
  }
}

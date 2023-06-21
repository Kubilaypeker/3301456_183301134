import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class pathProviderScreen extends StatefulWidget {
  @override
  _pathProviderScreenState createState() => _pathProviderScreenState();
}

class _pathProviderScreenState extends State<pathProviderScreen> {
  TextEditingController _textEditingController = TextEditingController();
  String _fileContent = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dosya İşlemleri'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Yazılacak metni girin',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _writeToFile,
              child: Text('Dosyaya Yaz'),
            ),
            ElevatedButton(
              onPressed: _readFromFile,
              child: Text('Dosyadan Oku'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Dosya İçeriği:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _fileContent,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> _writeToFile() async {
    final filePath = await _getFilePath();
    final file = File('$filePath/my_file.txt');

    try {
      await file.writeAsString(_textEditingController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dosyaya yazıldı')),
      );
      _textEditingController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dosyaya yazarken hata oluştu')),
      );
    }
  }

  Future<void> _readFromFile() async {
    final filePath = await _getFilePath();
    final file = File('$filePath/my_file.txt');

    try {
      final fileContent = await file.readAsString();
      setState(() {
        _fileContent = fileContent;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dosya okundu')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Dosya okurken hata oluştu')),
      );
    }
  }
}

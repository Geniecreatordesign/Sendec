// lib/home_page_web.dart
// Catatan: Kode ini hanya digunakan pada Flutter Web.
import 'dart:html' as html;
import 'dart:ui' as ui; // Perlu impor dart:ui untuk registrasi view factory.
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key) {
    // Register view factory hanya sekali.
    // Gunakan nama unik misalnya 'sendec-iframe'
    // Pastikan file sendec.html tersedia dan disertakan sebagai asset sehingga juga disalin ke folder build/web.
    // Jika asset tidak dapat diakses secara langsung, Anda bisa menghostingnya di server dan mengganti src-nya.
    ui.platformViewRegistry.registerViewFactory(
      'sendec-iframe',
      (int viewId) {
        final iframe = html.IFrameElement()
          ..src = 'assets/sendec.html'
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%'
          ..allowFullscreen = true;
        return iframe;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sendec Secure")),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: HtmlElementView(viewType: 'sendec-iframe'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test01/home_page.dart';
import 'package:test01/state.dart';

void main(List<String> args) {
  //ทำให้เต็มที่แล้วนะครับอาจจะมีไม่ตรงตามเงื่อนไขบ้างโปรดพิจารณารับเข้าร่วมทีมด้วยนะครับผมพร้อมที่จะเรียนรู้พัฒนาสร้างสรรค์ผลงานช่วยทีมบริษัทให้ได้มากสุดครับ
  runApp(
    ChangeNotifierProvider(
      create: (_) => Todo(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    ),
  );
}

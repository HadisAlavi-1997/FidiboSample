import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextField buildTextField(
    TextEditingController _searchController, {
      Color? textFieldColor, // مقدار پیش‌فرض ضخامت مرز
      double  borderRadius=1, //در صورت ندادن اندازه مقدار پیش‌فرض شعاع گردی
    }) {
  return TextField(
    controller: _searchController,
    decoration: InputDecoration(
      labelText: 'جستجو در فیدیبو',
      labelStyle: const TextStyle(
        fontFamily: 'Nazanin',
        fontSize: 18,
        color: Colors.grey, // رنگ متن لیبل (عنوان)
      ),
      fillColor: textFieldColor ?? Colors.white, // اگر رنگ مشخص نشد، رنگ سفید پیش‌فرض می‌شود
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius!),
        borderSide: const BorderSide(
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius!),
        borderSide: BorderSide(
          color: Color(0xD8FFFFFF),
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius!),
        borderSide: BorderSide(
          color: Color(0xD8FFFFFF),
          width: 1.0,
        ),
      ),
      prefixIcon: Icon(Icons.search, color: Colors.grey),
    ),
    style: TextStyle(
      color: Colors.black, // رنگ متن ورودی که کاربر تایپ می‌کند
    ),
  );
}


import 'package:flutter/material.dart';

const Color orangeTheme = Color(0xFFE5734E);

Widget _buildContactUsContent() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'ဆက်သွယ်ရန် (Get in Touch)',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: orangeTheme,
        ),
      ),
      SizedBox(height: 15),

      ListTile(
        leading: Icon(Icons.email, color: orangeTheme, size: 28),
        title: Text(
          'အီးမေးလ်',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          'support@appointmentapp.com',
          style: TextStyle(fontSize: 15),
        ),
        contentPadding: EdgeInsets.zero,
      ),
      Divider(),

      ListTile(
        leading: Icon(Icons.phone, color: orangeTheme, size: 28),
        title: Text(
          'ဖုန်းနံပါတ်',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text('+95 912 345 678', style: TextStyle(fontSize: 15)),
        contentPadding: EdgeInsets.zero,
      ),
      Divider(),

      ListTile(
        leading: Icon(Icons.location_on, color: orangeTheme, size: 28),
        title: Text(
          'လိပ်စာ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(
          '123 Main Street, Yangon, Myanmar',
          style: TextStyle(fontSize: 15),
        ),
        isThreeLine: true,
        contentPadding: EdgeInsets.zero,
      ),
      Divider(),

      SizedBox(height: 20),
      Text(
        'ကျွန်ုပ်တို့၏ ဝန်ဆောင်မှုနှင့်ပတ်သက်၍ သိလိုသည်များရှိပါက အချိန်မရွေး ဆက်သွယ်မေးမြန်းနိုင်ပါသည်။',
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    ],
  );
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: _buildContactUsContent(),
      ),
    );
  }
}

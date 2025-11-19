import 'package:flutter/material.dart';

const Color orangeTheme = Color(0xFFE5734E);

Widget _buildAboutUsContent() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'ကျွန်ုပ်တို့၏ ရည်ရွယ်ချက် (Our Mission)',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: orangeTheme,
        ),
      ),
      SizedBox(height: 10),
      Text(
        'ကျွန်ုပ်တို့သည် လုပ်ငန်းအသေးစားနှင့် အလတ်စားများအတွက် ချိန်းဆိုမှုမှတ်ပုံတင်ခြင်းနှင့် သုံးစွဲသူစီမံခန့်ခွဲမှု လုပ်ငန်းစဉ်များကို ပိုမိုလွယ်ကူချောမွေ့စေရန် ရည်ရွယ်ပါသည်။ သင့်ဖောက်သည်များကို မဆုံးရှုံးစေဘဲ ၎င်းတို့၏ အချက်အလက်အားလုံးကို စနစ်တကျ၊ အလွယ်တကူ ရှာဖွေနိုင်အောင် ထိန်းသိမ်းပေးပါသည်။',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 25),

      Text(
        'အဖွဲ့အစည်း (The Team)',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: orangeTheme,
        ),
      ),
      SizedBox(height: 10),
      Text(
        'ထိရောက်မှုရှိသော၊ လှပသော၊ သုံးရလွယ်ကူသော မိုဘိုင်းအက်ပလီကေးရှင်းများ ဖန်တီးရန် စိတ်အားထက်သန်သော Flutter developer အဖွဲ့မှ ဖန်တီးထားပါသည်။',
        style: TextStyle(fontSize: 16),
      ),
    ],
  );
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: _buildAboutUsContent(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:testingapp/base_architecture/presentation/pages/home_screen/about_page.dart';

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
              child: Text(
                answer, 
                style: const TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),
          ],
        ),
        const Divider(height: 1),
      ],
    );
  }
}
Widget _buildFAQContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'မေးလေ့ရှိသော မေးခွန်းများ (FAQ)',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: orangeTheme),
      ),
      const SizedBox(height: 15),

      const FAQItem(
        question: 'ဖောက်သည်အသစ်ကို ဘယ်လိုထည့်သွင်းရမလဲ?',
        answer: 'Home Screen ကနေ "Customer" ခလုတ်ကို နှိပ်ပြီး၊ လိုအပ်တဲ့ အချက်အလက်တွေ ဖြည့်ကာ Add ခလုတ်ကို နှိပ်ပါ။',
      ),
      const FAQItem(
        question: 'ချိန်းဆိုမှုတွေကို ဘယ်မှာကြည့်ရမလဲ?',
        answer: 'Home Screen ကနေ "Appointment" ခလုတ်ကို နှိပ်ပါ။ ပြက္ခဒိန်ပေါ်က အနီရောင်အမှတ်အသားပါတဲ့ ရက်စွဲတစ်ခုကို နှိပ်လိုက်ရင် အဲဒီနေ့အတွက် ဖောက်သည်စာရင်းကို မြင်ရပါလိမ့်မယ်။',
      ),
      const FAQItem(
        question: 'ဖောက်သည်စာရင်းကို စစ်ထုတ်လို့ရပါသလား?',
        answer: 'ရပါတယ်။ Customer List Screen မှာ နာမည်နဲ့ ရှာဖွေနိုင်သလို၊ ရက်စွဲအလိုက် စစ်ထုတ်ဖို့ "Filter" ခလုတ်ကိုလည်း နှိပ်နိုင်ပါတယ်။',
      ),
      const FAQItem(
        question: 'App ကို ဘယ်လို update လုပ်ရမလဲ?',
        answer: 'App store (သို့) Play store ကို သွားရောက်ပြီး update ပြုလုပ်နိုင်ပါတယ်။ အသစ်ထွက်ရှိလာပါက Notification မှတစ်ဆင့်လည်း အကြောင်းကြားပေးပါမည်။',
      ),
      
      const SizedBox(height: 20),
    ],
  );
}
class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: orangeTheme,
        title: const Text(
          'FAQ (မေးလေ့ရှိသော မေးခွန်းများ)',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(), 
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: _buildFAQContent(),
      ),
    );
  }
}

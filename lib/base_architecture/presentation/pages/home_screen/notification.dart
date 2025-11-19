import 'package:flutter/material.dart';
import 'package:testingapp/base_architecture/presentation/pages/home_screen/about_page.dart';

class NotificationItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final DateTime time;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.time,
  });
}

final List<NotificationItem> mockNotifications = [
  NotificationItem(
    title: 'ချိန်းဆိုမှု အသစ် (Confirmed)',
    subtitle: 'ဖောက်သည် စိုးမင်းမင်း မှ မနက်ဖြန် နံနက် ၉:၀၀ နာရီအတွက် ချိန်းဆိုမှုကို အတည်ပြုလိုက်ပါပြီ။',
    icon: Icons.calendar_today,
    iconColor: Colors.green,
    time: DateTime.now().subtract(const Duration(minutes: 10)),
  ),
  NotificationItem(
    title: 'စနစ် အဆင့်မြှင့်တင်မှု (System Update)',
    subtitle: 'App version အသစ် 2.1.0 ကို ထုတ်ပြန်လိုက်ပါပြီ။ Performance ပိုမိုမြန်ဆန်လာမည်။',
    icon: Icons.system_update_alt,
    iconColor: orangeTheme,
    time: DateTime.now().subtract(const Duration(hours: 3)),
  ),
  NotificationItem(
    title: 'သတိပေးချက်: ချိန်းဆိုမှု ပယ်ဖျက်ခြင်း',
    subtitle: 'ဖောက်သည် မေသူဇာ မှ ယနေ့ညနေ ၄:၃၀ နာရီ ချိန်းဆိုမှုကို ပယ်ဖျက်လိုက်ပါသည်။',
    icon: Icons.cancel,
    iconColor: Colors.red,
    time: DateTime.now().subtract(const Duration(hours: 10)),
  ),
  NotificationItem(
    title: 'သုံးစွဲသူ အသစ် (New Customer)',
    subtitle: 'ဖောက်သည် အောင်ကိုကို ကို စာရင်းထဲသို့ အောင်မြင်စွာ ထည့်သွင်းလိုက်ပါပြီ။',
    icon: Icons.person_add,
    iconColor: Colors.blue,
    time: DateTime.now().subtract(const Duration(days: 1)),
  ),
];

String _formatTime(DateTime time) {
  final difference = DateTime.now().difference(time);
  if (difference.inMinutes < 60) {
    return '${difference.inMinutes} မိနစ်ခန့်က';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} နာရီခန့်က';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} ရက်ခန့်က';
  } else {
    return '${time.day}/${time.month}/${time.year}';
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: orangeTheme,
        title: const Text(
          'Notifications (အသိပေးချက်များ)',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(), 
        ),
        elevation: 0,
      ),
      
      body: ListView.builder(
        itemCount: mockNotifications.length,
        itemBuilder: (context, index) {
          final item = mockNotifications[index];
          return Column(
            children: [
              ListTile(
                // ဘယ်ဘက်ခြမ်းတွင် Icon နှင့် Notification အမျိုးအစားအလိုက် အရောင်ပြောင်းခြင်း
                leading: CircleAvatar(
                  backgroundColor: item.iconColor.withOpacity(0.1),
                  child: Icon(item.icon, color: item.iconColor),
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                subtitle: Text(
                  item.subtitle,
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: Text(
                  _formatTime(item.time),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                onTap: () {
                  debugPrint('Notification tapped: ${item.title}');
                },
              ),
              const Divider(height: 1),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:testingapp/base_architecture/app_setting/utils/date_time_utils.dart';
import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
import 'package:testingapp/base_architecture/presentation/pages/customer_screen/customer_listview_page.dart';
import 'dart:convert';

class CustomerListItem extends StatelessWidget {
  final CustomerModel customer;

  const CustomerListItem({super.key, required this.customer});

  static const Color orangeTheme = Color(0xFFE5734E);

  Widget _buildCustomerImage() {
    final String? base64Image = customer.image;

    if (base64Image != null && base64Image.isNotEmpty) {
      try {
        final bytes = base64Decode(base64Image);

        return ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.memory(
            bytes,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.error_outline,
                size: 50,
                color: Colors.red,
              );
            },
          ),
        );
      } catch (e) {
        debugPrint('Base64 decode error for customer ${customer.id}: $e');
        return const Icon(
          Icons.image_not_supported,
          size: 50,
          color: Colors.grey,
        );
      }
    }
    return const Icon(Icons.account_circle, size: 50, color: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: _buildCustomerImage(),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer.name ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    customer.address ?? "",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              const TextSpan(
                                text: 'APPT : ',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: orangeTheme,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '${customer.appointmentDate!.format('dd MMM yyyy')} Result : ',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                              const TextSpan(
                                text: "△",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      Text(
                        customer.phone ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () => makePhoneCall(customer.phone ?? ""),
              child: const Padding(
                padding: EdgeInsets.only(left: 12.0, top: 10),
                child: Icon(Icons.phone, color: Color(0xFF5CB85C), size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

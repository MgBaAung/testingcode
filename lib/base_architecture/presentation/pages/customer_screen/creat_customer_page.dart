import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/app_route.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/custom_textfield.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/navigation_service.dart';
import 'package:testingapp/base_architecture/data/local_datasource/hive_local_datasource.dart';
import 'package:testingapp/base_architecture/data/local_datasource/token_manager.dart';
import 'package:testingapp/base_architecture/data/network_datasource/http_network.dart';
import 'package:testingapp/base_architecture/domain/entity/customer_entity.dart';
import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
import 'package:testingapp/base_architecture/domain/repository/api_repository_with_local.dart';
import 'package:testingapp/base_architecture/domain/usecase/baste_usecase.dart';
import 'package:testingapp/base_architecture/presentation/bloc/api_state.dart';
import 'package:testingapp/base_architecture/presentation/pages/customer_screen/bloc/customer_bloc.dart';
import 'package:testingapp/main.dart';

class CustomerInfoScreen extends StatefulWidget {
  const CustomerInfoScreen({super.key});

  @override
  State<CustomerInfoScreen> createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _imageBase64;

  String _selectedGender = 'Male';
  var name = TextEditingController();
  var phone = TextEditingController();
  var dob = TextEditingController();
  var attDay = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              ApiRepositoryWithLocalStorage<CustomerModel, CustomerEntity>(
                networkClient: context.read<HttpNetworkClient>(),
                tokenManager: context.read<TokenManager>(),
                localDataSource: HiveLocalDataSourceImpl(
                  entityFactory: () => CustomerEntity(id: ''),
                  box: customerBox,
                ),
              ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CustomerBloc(
              crudUsecase: CrudUseCase<CustomerModel>(
                repository: context
                    .read<
                      ApiRepositoryWithLocalStorage<
                        CustomerModel,
                        CustomerEntity
                      >
                    >(),
              ),
            ),
          ),
        ],
        child: Builder(
          builder: (context) {
            return BlocListener(
              bloc: context.read<CustomerBloc>(),
              listener: (context, state) {
                if (state is ApiSuccess) {
                  NavigationService.instance.pushNamedAndRemoveUntil(
                    AppRoute.home,
                  );
                }
              },
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.deepOrange,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: const Text(
                    'Customer Information',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInputField(
                          'Name',
                          'Enter customer name',
                          controller: name,
                        ),
                        const SizedBox(height: 20),

                        _buildInputField(
                          'Phone',
                          'Enter phone number',
                          keyboardType: TextInputType.phone,
                          controller: phone,
                        ),
                        const SizedBox(height: 20),

                        const Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            _buildGenderRadio('Male'),
                            const SizedBox(width: 30),
                            _buildGenderRadio('Female'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildInputField(
                          'Date of Birth',
                          'Select date of birth',
                          isDate: true,
                          controller: dob,
                        ),
                        const SizedBox(height: 20),
                        _buildInputField(
                          'Appointment Date',
                          'Select appointment date',
                          isDate: true,
                          controller: attDay,
                        ),
                        const SizedBox(height: 30),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildImageUploadArea(),
                            const Spacer(),
                            _buildAddButton(context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    String hintText, {
    TextInputType keyboardType = TextInputType.text,
    bool isDate = false,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          textInputType: keyboardType,
          readonly: isDate,
          onTap: isDate ? () => _selectDate(context, label) : null,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter requirement.';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildGenderRadio(String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<String>(
          value: value,
          groupValue: _selectedGender,
          onChanged: (String? newValue) {
            setState(() {
              _selectedGender = newValue!;
            });
          },
          activeColor: Colors.deepOrange,
        ),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildImageUploadArea() {
    return GestureDetector(
      onTap: _pickAndConvertImage,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.deepOrange,
            width: 2,
          ), // Orange Border
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.camera_alt, color: Colors.deepOrange, size: 40),
            Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return BlocSelector(
      builder: (context, isLoading) {
        return ElevatedButton(
          onPressed: isLoading
              ? () {}
              : () {
                  if (_formKey.currentState!.validate()) {
                    var customer = CustomerModel(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: name.text,
                      phone: phone.text,
                      address: "No123, Bogyoke Aung San Rd, Kyauktada Township",
                      gender: _selectedGender,
                      dob: DateTime.tryParse(dob.text),
                      image: _imageBase64,

                      appointmentDate: DateTime.tryParse(attDay.text),
                    );
                    context.read<CustomerBloc>().addCustomer(customer);
                  }
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            minimumSize: const Size(100, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: Colors.deepOrange),
            ),
          ),
          child: Text(
            isLoading ? 'Loading' : 'Add',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
      },
      selector: (state) {
        try {
          bool isLoading = state is ApiLoading;
          return isLoading;
        } catch (_) {
          return false;
        }
      },
      bloc: context.read<CustomerBloc>(),
    );
  }

  Future<void> _selectDate(BuildContext context, String label) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formattedDate = formatter.format(picked);
      if (label == "Date of Birth") {
        dob.text = formattedDate;
      } else {
        attDay.text = formattedDate;
      }
    }
  }

  Future<void> _pickAndConvertImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      final bytes = await file.readAsBytes();
      setState(() {
        _imageBase64 = base64Encode(bytes);
      });
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Image picking mocked. Base64 string is ready.'),
        ),
      );
    }
  }
}

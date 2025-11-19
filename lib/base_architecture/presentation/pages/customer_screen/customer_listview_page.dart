import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/app_route.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/navigation_service.dart';
import 'package:testingapp/base_architecture/data/local_datasource/hive_local_datasource.dart';
import 'package:testingapp/base_architecture/data/local_datasource/token_manager.dart';
import 'package:testingapp/base_architecture/data/network_datasource/http_network.dart';
import 'package:testingapp/base_architecture/domain/entity/customer_entity.dart';
import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
import 'package:testingapp/base_architecture/presentation/bloc/api_state.dart';
import 'package:testingapp/base_architecture/presentation/pages/customer_screen/bloc/customer_list_bloc.dart';
import 'package:testingapp/base_architecture/presentation/pages/customer_screen/bloc/customer_list_repository.dart';
import 'package:testingapp/base_architecture/presentation/pages/customer_screen/bloc/customer_list_usecase.dart';
import 'package:testingapp/base_architecture/presentation/pages/customer_screen/widgets/customer_list_item.dart';
import 'package:testingapp/main.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerListScreen extends StatefulWidget {
  final DateTime date;
  const CustomerListScreen({super.key, required this.date});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  static const Color orangeTheme = Color(0xFFE5734E);

  final TextEditingController _searchController = TextEditingController();
  List<CustomerModel> _customers = [];
  bool _isLoading = false;

  String _currentFilterName = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadCustomers({
    required bool isInitial,
    required BuildContext context,
  }) async {
    if (!isInitial && _isLoading) return;

    setState(() {
      _isLoading = true;
      if (isInitial) _customers.clear();
    });

    context.read<CustomerListBloc>().fetchPaginatedCustomers(
      appointmentDate: widget.date.toIso8601String().split('T').first,
      nameFilter: _currentFilterName,
    );
  }

  void _handleSearch(String filter, BuildContext context) {
    setState(() {
      _currentFilterName = filter;
    });
    _loadCustomers(isInitial: true, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CustomerListRepository(
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
            create: (context) =>
                CustomerListBloc(
                  crudUsecase: CustomerListUsecase(
                    repository: context.read<CustomerListRepository>(),
                  ),
                )..fetchPaginatedCustomers(
                  appointmentDate: widget.date
                      .toIso8601String()
                      .split('T')
                      .first,
                  nameFilter: _currentFilterName,
                ),
          ),
        ],
        child: BlocConsumer<CustomerListBloc, ApiState>(
          listener: (context, state) {
            if (state is ApiLoading) {
            } else if (state is ApiSuccess<List<CustomerModel>>) {
              final newCustomers = state.data;
              setState(() {
                _isLoading = false;

                _customers = newCustomers;
              });
            } else if (state is ApiFailure) {
              setState(() {
                _isLoading = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error loading customers: ${state.message}'),
                ),
              );
            }
          },
          builder: (context, state) {
            final bool currentlyLoading = state is ApiLoading;

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: orangeTheme,
                title: const Text(
                  'Customer List',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                elevation: 0,
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onSubmitted: (value) {
                              _handleSearch(value, context);
                            },
                            onChanged: (value) {
                              if (value.isEmpty &&
                                  _currentFilterName.isNotEmpty) {
                                _handleSearch('', context);
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Search by name...',
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              suffixIcon: _searchController.text.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        _searchController.clear();
                                        _handleSearch('', context);
                                      },
                                    )
                                  : null,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: orangeTheme,
                                  width: 2,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            _handleSearch(_searchController.text, context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: orangeTheme,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 31,
                            ),
                            elevation: 4,
                            shadowColor: Colors.black54,
                          ),
                          child: const Text(
                            'Filter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_customers.isEmpty && currentlyLoading)
                    const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(color: orangeTheme),
                      ),
                    )
                  else if (_customers.isEmpty && !currentlyLoading)
                    const Expanded(
                      child: Center(
                        child: Text(
                          'No customers found for this date.',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: _customers.length,
                        itemBuilder: (context, index) {
                          final customer = _customers[index];
                          return CustomerListItem(customer: customer);
                        },
                      ),
                    ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  NavigationService.instance.pushNamed(AppRoute.customer);
                },
                backgroundColor: Colors.red[400],
                shape: const CircleBorder(),
                child: const Icon(Icons.add, color: Colors.white, size: 30),
              ),
            );
          },
        ),
      ),
    );
  }
}

void makePhoneCall(String phoneNumber) async {
  final url = Uri.parse('tel:$phoneNumber');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    debugPrint('Could not launch $url');
  }
}

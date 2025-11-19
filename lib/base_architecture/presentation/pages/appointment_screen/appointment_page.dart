
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/app_route.dart';
import 'package:testingapp/base_architecture/app_setting/widget_utils/navigation_service.dart';
import 'package:testingapp/base_architecture/data/local_datasource/hive_local_datasource.dart';
import 'package:testingapp/base_architecture/data/local_datasource/token_manager.dart';
import 'package:testingapp/base_architecture/data/network_datasource/http_network.dart';
import 'package:testingapp/base_architecture/domain/entity/customer_entity.dart';
import 'package:testingapp/base_architecture/domain/model/customer_model.dart';
import 'package:testingapp/base_architecture/presentation/bloc/api_state.dart';
import 'package:testingapp/base_architecture/presentation/pages/appointment_screen/bloc/appointment_bloc.dart';
import 'package:testingapp/base_architecture/presentation/pages/appointment_screen/bloc/appointment_repository.dart';
import 'package:testingapp/base_architecture/presentation/pages/appointment_screen/bloc/appointment_usecase.dart';
import 'package:testingapp/main.dart';

class AppointmentCalendarScreen extends StatefulWidget {
  const AppointmentCalendarScreen({super.key});

  @override
  State<AppointmentCalendarScreen> createState() =>
      _AppointmentCalendarScreenState();
}

class _AppointmentCalendarScreenState extends State<AppointmentCalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, int> _events = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  List<int> _getEventsForDay(DateTime day) {
    final dateOnly = DateTime(day.year, day.month, day.day);

    final count = _events[dateOnly];
    if (count != null) {
      return [count];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AppointmentRepository(
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
            create: (context) => AppointmentBloc(
              crudUsecase: AppointmentUsecase(
                repository: context.read<AppointmentRepository>(),
              ),
            )..fetchOneMonthCustomers(_focusedDay),
          ),
        ],
        child: BlocConsumer<AppointmentBloc, ApiState>(
          listener: (context, state) {
            if (state is ApiSuccess<List<CustomerModel>>) {
              final customers = state.data;
              
              final appointmentDataList = customers
                  .where((c) => c.appointmentDate != null)
                  .map(
                    (c) => AppointmentData(
                      customerName: c.name ?? 'အမည်မရှိ',
                      appointmentDate: c.appointmentDate!,
                    ),
                  )
                  .toList();

              setState(() {
                _events = _aggregateAppointments(appointmentDataList);
              });
            }
          },
          builder: (context, state) {
            final isLoading = state is ApiLoading;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepOrange,
                title: const Text(
                  'Appointment',
                  style: TextStyle(color: Colors.white),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              body: Stack(
                children: [
                  Column(
                    children: [
                      TableCalendar(
                        focusedDay: _focusedDay,
                        firstDay: DateTime.utc(2024, 1, 1),
                        lastDay: DateTime.utc(2026, 12, 31),
                        calendarFormat: CalendarFormat.month,
                        startingDayOfWeek: StartingDayOfWeek.sunday,
                        headerStyle: const HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                          context
                              .read<AppointmentBloc>()
                              .fetchOneMonthCustomers(focusedDay);
                        },

                        eventLoader: _getEventsForDay,

                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (context, day, events) {
                            if (events.isNotEmpty) {
                              final count = events.first as int;
                              return Positioned(
                                right: 1,
                                bottom: 1,
                                child: _buildBadge(count),
                              );
                            }
                            return null;
                          },

                          todayBuilder: (context, day, focusedDay) {
                            return Center(
                              child: Text(
                                '${day.day}',
                                style: TextStyle(
                                  color: isSameDay(day, _selectedDay)
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),

                        onDaySelected: (selectedDay, focusedDay) {
                          if (!isSameDay(_selectedDay, selectedDay)) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            });
                            NavigationService.instance.pushNamed(
                              AppRoute.customerList,
                              args: selectedDay,
                            );
                          }
                        },

                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),

                  if (isLoading)
                    Container(
                      color: Colors.black.withOpacity(0.1),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  NavigationService.instance.pushNamed(AppRoute.customer);
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBadge(int count) {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '$count',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AppointmentData {
  final String customerName;
  final DateTime appointmentDate;

  AppointmentData({required this.customerName, required this.appointmentDate});

  factory AppointmentData.fromJson(Map<String, dynamic> json) {
    return AppointmentData(
      customerName: json['customerName'] as String,
      appointmentDate: DateTime.parse(json['appointmentDate'] as String),
    );
  }
}

Map<DateTime, int> _aggregateAppointments(List<AppointmentData> appointments) {
  final Map<DateTime, int> aggregatedMap = {};

  for (var appointment in appointments) {
    final dateOnly = DateTime(
      appointment.appointmentDate.year,
      appointment.appointmentDate.month,
      appointment.appointmentDate.day,
    );
    aggregatedMap[dateOnly] = (aggregatedMap[dateOnly] ?? 0) + 1;
  }

  return aggregatedMap;
}

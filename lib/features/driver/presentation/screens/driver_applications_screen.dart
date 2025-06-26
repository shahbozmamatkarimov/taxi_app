import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/core/resources/app_colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../bloc/driver_bloc.dart';
import 'package:auto_route/annotations.dart';

@RoutePage()
class DriverApplicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Applications'),
      ),
      body: BlocProvider(
        create: (context) => DriverBloc()..add(FetchDriverApplications()),
        child: BlocBuilder<DriverBloc, DriverState>(
          builder: (context, state) {
            if (state is DriverLoading) return const Center(child: CircularProgressIndicator());
            if (state is DriverLoaded) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text('3 Applications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ...state.applications.map((app) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage('https://via.placeholder.com/40')),
                      title: Text('${app['name']} ★${app['rating']}'),
                      subtitle: Text('${app['car']} • ${app['plate']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(icon: const Icon(Icons.phone), onPressed: () {}),
                          IconButton(icon: const Icon(Icons.chat_bubble), onPressed: () {}),
                        ],
                      ),
                      titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                      subtitleTextStyle: TextStyle(color: AppColors.grey),
                    ),
                  )).toList(),
                  const SizedBox(height: 16),
                  CustomButton(
                    text: AppStrings.autoAssign,
                    onPressed: () {},
                    color: AppColors.green,
                  ),
                  const Text("We'll automatically select the highest rated driver closest to you"),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
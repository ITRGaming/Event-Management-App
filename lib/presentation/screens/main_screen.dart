// ignore_for_file: library_private_types_in_public_api

import 'package:egm/bloc/main/main_bloc.dart';
import 'package:egm/presentation/screens/events.dart';
import 'package:egm/presentation/screens/profile.dart';
import 'package:egm/presentation/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    const EventsScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Event Management App'),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.tabIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            onTap: (index) {
              context.read<MainBloc>().add(TabChangedEvent(tabIndex: index));
            },
          ),
          body: _screens[state.tabIndex],
        );
      },
    );
  }
}

import 'package:bloc_sample_counter_app/counter_cubit/counter_cubit.dart';
import 'package:bloc_sample_counter_app/screens/screens_with_blockBuilder.dart';
import 'package:bloc_sample_counter_app/screens/screens_with_blockBuilder_and_blockListener.dart';
import 'package:bloc_sample_counter_app/screens/screens_with_blockConsumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: ScreensWithBlockConsumer(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
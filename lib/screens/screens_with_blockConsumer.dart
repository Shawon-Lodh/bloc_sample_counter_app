import 'package:bloc_sample_counter_app/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreensWithBlockConsumer extends StatefulWidget {
  const ScreensWithBlockConsumer({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<ScreensWithBlockConsumer> createState() =>
      _ScreensWithBlockConsumerState();
}

class _ScreensWithBlockConsumerState
    extends State<ScreensWithBlockConsumer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if(state.countingStyle == CountingStyle.increment) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Incremented"),duration: Duration(milliseconds: 100),));
                }else if(state.countingStyle == CountingStyle.decrement) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Decremented"),duration: Duration(milliseconds: 100),));
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                );
              },
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).decrement();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}

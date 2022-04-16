import 'package:bloc_sample_counter_app/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ScreensWithBlockBuilder extends StatefulWidget {
  const ScreensWithBlockBuilder({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<ScreensWithBlockBuilder> createState() =>
      _ScreensWithBlockBuilderState();
}

class _ScreensWithBlockBuilderState extends State<ScreensWithBlockBuilder> {
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
            BlocBuilder<CounterCubit, CounterState>(
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
              onPressed: (){
                BlocProvider.of<CounterCubit>(context).decrement();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: (){
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

part of 'counter_cubit.dart';

enum CountingStyle{
  increment,
  decrement
}

class CounterState{
  int counterValue;
  CountingStyle? countingStyle;
  CounterState({required this.counterValue, this.countingStyle});
}

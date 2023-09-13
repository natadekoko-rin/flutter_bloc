import 'package:belajar_bloc/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  Counter mycounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Block Consumer'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<Counter, int>(
              bloc: mycounter,
              listener: (context, state) {
                //ini akan dijalankan ketika terjadi perubahan di bloc builder
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text("Kelipatan 2"),
                ));
              },
              listenWhen: (previous, current) {
                if (current % 2 == 0) {
                  return true;
                } else {
                  return false;
                }
              },
              buildWhen: (previous, current) {
                if (current >= 10) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                return Text(
                  "$state",
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      mycounter.decrement();
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      mycounter.increment();
                    },
                    icon: const Icon(Icons.add))
              ],
            )
          ],
        ));
  }
}

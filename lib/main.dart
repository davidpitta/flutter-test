import 'package:flutter/material.dart';
import 'screens/task_screen.dart';
import 'provider/task_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TaskProvider())
        ], 
        child: MaterialApp(
            title: 'Custom Card',
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: Scaffold(
              appBar: AppBar(
                title: const Text("Título"),
              ),
              body: const TaskScreen(),
            )
        )
    );
      
  }
}

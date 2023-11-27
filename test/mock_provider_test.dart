import 'package:exercicio_provider/models/task.dart';
import 'package:exercicio_provider/provider/task_provider.dart';
import 'package:exercicio_provider/screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'mock_test_provider.mocks.dart';

@GenerateMocks([TaskProvider])
void main() {
  testWidgets("Widgets Mocks", (WidgetTester tester) async {
    MockTaskProvider taskProvider = MockTaskProvider();
    when(taskProvider.tasks).thenReturn(
        [Task(id: const Uuid().v4(), name: "Teste", concluida: false)]);

    Widget app = MultiProvider(providers: [
      ChangeNotifierProvider<TaskProvider>(create: (context) => taskProvider)
    ], child: const MaterialApp(home: TaskScreen()));

    await tester.pumpWidget(app);

    expect(find.text("Teste"), findsOneWidget);

    var checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.value, false);
  });

  testWidgets("Interação Usuário Checkbox", (WidgetTester tester) async {
    MockTaskProvider taskProvider = MockTaskProvider();
    when(taskProvider.tasks).thenReturn(
        [Task(id: const Uuid().v4(), name: "Teste", concluida: false)]);

    Widget app = MultiProvider(providers: [
      ChangeNotifierProvider<TaskProvider>(create: (context) => taskProvider)
    ], child: const MaterialApp(home: TaskScreen()));

    await tester.pumpWidget(app);

    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    var checkbox = tester.firstWidget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.value, true);
  });

  testWidgets("Interação Usuário Deletar", (WidgetTester tester) async {
    MockTaskProvider taskProvider = MockTaskProvider();
    when(taskProvider.tasks).thenReturn(
        [Task(id: const Uuid().v4(), name: "Teste", concluida: false)]);

    Widget app = MultiProvider(providers: [
      ChangeNotifierProvider<TaskProvider>(create: (context) => taskProvider)
    ], child: const MaterialApp(home: TaskScreen()));

    await tester.pumpWidget(app);

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    expect(find.text("Teste"), findsNothing);
  });
}

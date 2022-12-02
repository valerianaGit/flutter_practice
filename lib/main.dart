import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// declare providers
final helloWorldProvider = Provider((_) => 'Hello world');
void main() {
  // build Providerscope at root of your app
  runApp( const ProviderScope(child: MyApp()) );
}

// make classes that depend on providers extend Consumer Widget 
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  // add the WidgetRef to the build constructor of the widget, to have reference to it 
  Widget build(BuildContext context, WidgetRef ref) {
    // declare the value to be used 
    final String value = ref.watch(helloWorldProvider);
    return MaterialApp(
      home: Scaffold(
        // use the 
        appBar: AppBar(title: Text(value)),
        body: Center(child: Text(value),),
      ),
    );
  }
}




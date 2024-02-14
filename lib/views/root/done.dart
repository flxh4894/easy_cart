import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoneMainPage extends ConsumerStatefulWidget {
  const DoneMainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoneMainPageState();
}

class _DoneMainPageState extends ConsumerState<DoneMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done'),
      ),
      body: const Center(
        child: Text('Done'),
      ),
    );
  }
}

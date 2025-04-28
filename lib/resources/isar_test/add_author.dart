import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xiphone/App/Providers/providers.dart';

class AddAuthor extends ConsumerWidget {
  const AddAuthor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isarService = ref.watch(isarServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Author'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // isarService.cre
        },
        child: Row(
          children: [Icon(CupertinoIcons.add), Text('Add Author')],
        ),
      ),
    );
  }
}

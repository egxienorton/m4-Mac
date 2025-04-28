

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xiphone/App/Providers/providers.dart';

class AddCategory extends ConsumerWidget {
  const AddCategory({super.key});
 @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isarService = ref.watch(isarServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
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

import 'package:flutter/material.dart';

import 'generated/l10n.dart';

class ModuleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Text('module text:${S.of(context).moduleTest}'),
    );
  }
}

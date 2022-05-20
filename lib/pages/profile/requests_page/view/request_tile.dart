import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/requests/chem_request.dart';
import '../../../../models/requests/request_status.dart';

class RequestTile extends StatelessWidget {
  final ChemRequest request;

  const RequestTile({
    Key? key,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('dd.MM.yyyy').format(request.dateTimeSended);
    return ListTile(
      tileColor: request.status.getColorBackground(context),
      textColor: request.status.getColorForeground(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      title: Text('${request.theme} ($date)'),
      subtitle: Text(request.text),
    );
  }
}

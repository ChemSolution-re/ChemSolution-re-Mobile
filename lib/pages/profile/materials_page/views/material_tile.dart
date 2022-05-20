import 'package:flutter/material.dart';

import '../../../../models/materials/material.dart';
import '../../../../models/materials/material_group.dart';

class MaterialTile extends StatelessWidget {
  final ChemMaterial material;

  const MaterialTile({
    Key? key,
    required this.material,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: ListTile(
        leading: Image.network(
          material.image,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
        title: Text(
          '${material.name} (${material.formula})',
          style: Theme.of(context).textTheme.headline3,
        ),
        subtitle: Text(
          material.materialGroup.getTitle(context),
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: Text(material.info),
        )
      ],
    );
  }
}

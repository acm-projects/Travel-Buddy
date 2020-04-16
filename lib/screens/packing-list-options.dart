/*

import 'package:flutter/material.dart';

class NewPackingListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(('Expansion List')),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) =>
              PackingListCategoryItem(data[index]),
        ),
      ),
    );
  }
}

class PackingListCategory {
  final String title;
  final List<PackingListCategory> children;

  PackingListCategory(this.title,
      [this.children = const <PackingListCategory>[]]);
}

final List<PackingListCategory> data = <PackingListCategory>[
  PackingListCategory('Toliteries', <PackingListCategory>[
    PackingListCategory('Deodorant'),
    PackingListCategory('Toothbrush'),
    PackingListCategory('Toothpaste'),
    PackingListCategory('Hair brush/comb'),
    PackingListCategory('Lense solution + lense case'),
    PackingListCategory('Shampoo + Conditioner'),
    PackingListCategory('Shaving kit'),
    PackingListCategory('Makeup Remover'),
  ]),
  PackingListCategory('Health', <PackingListCategory>[
    PackingListCategory('First aid kit (bandages, antibacterial wipes, etc.)'),
    PackingListCategory('Thermometer'),
    PackingListCategory('Cough drops'),
    PackingListCategory('Prescription Medications'),
    PackingListCategory('Multivitamins'),
    PackingListCategory('Shampoo + Conditioner'),
    PackingListCategory('Sunburn relief'),
    PackingListCategory('Insect repellent'),
  ]),

  PackingListCategory('Carry On', <PackingListCategory>[
    PackingListCategory('Passport + additional documents'),
    PackingListCategory('Hand Sanitizer '),
    PackingListCategory('Advil'),
    PackingListCategory('Sleep medication'),
    PackingListCategory('Device chargers'),
    PackingListCategory('Cameras'),
    PackingListCategory('Headphones + adapters for in flight service'),
    PackingListCategory('Travel pillow'),
    PackingListCategory('Chapstick/Lotions'),
  ]),

  PackingListCategory('Infant', <PackingListCategory>[
    PackingListCategory('Baby Wipes'),
    PackingListCategory('Formula'),
    PackingListCategory('Diapers'),
    PackingListCategory('Wet Wipes'),
    PackingListCategory('Bottles'),
    PackingListCategory('Pacifiers'),
  ])
];

class PackingListCategoryItem extends StatelessWidget {
  const PackingListCategoryItem(this.entry);

  final PackingListCategory entry;

  Widget _buildTiles(PackingListCategory root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<PackingListCategory>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildTiles(entry);
  }
}
*/


import 'package:flutter/material.dart';

class DeshBordScreen extends StatefulWidget {
  const DeshBordScreen({super.key});

  @override
  State<DeshBordScreen> createState() => _DeshBordScreenState();
}

class _DeshBordScreenState extends State<DeshBordScreen> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _priceEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  List itemStore = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tech Store'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'product Title',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  String v = value ?? "";
                  if (v.isEmpty) {
                    return 'product Title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                controller: _priceEditingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'product Price',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  String v = value ?? "";
                  if (v.isEmpty) {
                    return 'product Price';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Add'),
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      itemStore.add(
                        {
                          'Product': _nameEditingController.text,
                          'Price': _priceEditingController.text,
                        },
                      );
                      clear();
                      setState(() {});
                    }
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: itemStore.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(itemStore[index]['Product']),
                      subtitle: Text(itemStore[index]['Price']),
                      leading: Image(image: AssetImage('images/product.jpg')),
                      trailing: InkWell(
                        onTap: () {
                          itemStore.remove(itemStore[index]);
                          setState(() {});
                        },
                        child: Icon(Icons.delete),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 3,
                      height: 2,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clear() {
    _priceEditingController.clear();
    _nameEditingController.clear();
  }
}

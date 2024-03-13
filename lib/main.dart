import 'package:flutter/material.dart';
import 'package:flutter_application_1/module/date_base.dart';
import 'page_user.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MainPageStore(),
    ),
  );
}

class MainPageStore extends StatefulWidget {
  const MainPageStore({super.key});

  @override
  State<MainPageStore> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainPageStore> {
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: catalog_cars.length,
      itemBuilder: _createListView,
    );
  }

  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidget(id: selectIndex),));
          selectIndex = index;
        });
      },
      child: Card(
        color: index == selectIndex
            ? Color.fromARGB(255, 255, 122, 50)
            : Color.fromARGB(255, 255, 224, 71),
        child: ListTile(
          
          title: Image.asset(catalog_cars[index].carsPhoto[0]),
          subtitle: Column(
            children: [
              Text(
                catalog_cars[index].name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                catalog_cars[index].discription,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                catalog_cars[index].price.toString() + " Руб.",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_b4/constant/app_image.dart';
import 'package:ppkd_b4/extension/rupiah.dart';

class ListviewListMapWidgetDay17 extends StatefulWidget {
  const ListviewListMapWidgetDay17({super.key});

  @override
  State<ListviewListMapWidgetDay17> createState() =>
      _ListviewListMapWidgetDay17State();
}

class _ListviewListMapWidgetDay17State
    extends State<ListviewListMapWidgetDay17> {
  final List<Map<String, dynamic>> namaBuah = [
    {
      "name": "Mangga",
      "price": 5000,
      "condition": "Segar",
      "image": AppImages.mangga,
    },
    {
      "name": "Apel",
      "price": 5000,
      "condition": "Segar",
      "image": AppImages.apell,
    },
    {
      "name": "Jeruk",
      "price": 15000,
      "condition": "Segar",
      "image": AppImages.jeruk,
    },
    {
      "name": "Durian",
      "price": 35000,
      "condition": "Segar",
      "image": AppImages.durian,
    },
    {
      "name": "Pisang",
      "price": 2000,
      "condition": "Segar",
      "image": AppImages.pisang,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaBuah.length,
      itemBuilder: (BuildContext context, int index) {
        final item = namaBuah[index];
        return ListTile(
          onTap: () {
            //Versi 1
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     backgroundColor: AppColor.army1,
            //     content: Text(
            //       "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            //     ),
            //   ),
            // );

            //Versi 2
            // Fluttertoast.showToast(
            //   backgroundColor: Colors.blue,
            //   msg:
            //       "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            // );

            //Versi 3
            DelightToastBar(
              autoDismiss: true,
              snackbarDuration: Duration(milliseconds: 2000),
              builder: (context) => ToastCard(
                leading: Icon(Icons.flutter_dash, size: 28),
                title: Text(
                  "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
            ).show(context);
          },
          leading: Image.asset(item["image"], width: 60),
          title: Text(item["name"]),
          subtitle: Text(item["price"].toString().toRPCurrency()),
        );
      },
    );
  }
}

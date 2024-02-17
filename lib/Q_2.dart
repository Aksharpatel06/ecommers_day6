import 'package:ecommers_day6/util/productdata.dart';
import 'package:flutter/material.dart';

class product extends StatefulWidget {
  const product({super.key});

  @override
  State<product> createState() => _productState();
}

class _productState extends State<product> {
  @override
  Widget build(BuildContext context) {

    double heigth = MediaQuery.sizeOf(context).height;
    Widget productrange({int? index,String? name,String? brand,double? prize}) {
      return Container(
        margin: EdgeInsets.all(8),
        height: heigth*0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 2,
                  offset: const Offset(0, 4)
              )
            ]
        ),
        child: ListTile(
          subtitle: Text(brand!),
          leading: Text('${index!+1}'),
          title: Text(name!,overflow: TextOverflow.ellipsis,),
          trailing: Text('$prize'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2193f3),
        title: Text(
          'Product Filter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: heigth * 0.1,
              child: Column(
                children: [
                  Slider(
                    value: x,
                    min: 1000,
                    max: 100000,
                    divisions: 99,
                    activeColor: Colors.grey,
                    thumbColor: Color(0xff1F295C),
                    onChanged: (value) {
                      x = value;
                      setState(() {
                      });
                    },
                  ),
                  Text('All product < Rs. ${x.toStringAsFixed(0)}'),
                ],
              ),
            ),
          ),
          Container(
            height: heigth*0.78,
            child: ListView(
              children: [
                ...List.generate(prodect.length, (index) =>(prodect[index]['prize']<x)? productrange(index: index,name: prodect[index]['name'],prize: prodect[index]['prize'],brand: prodect[index]['brand']):Container()),]
            ),
          )
        ],
      ),
    );
  }
}
double x = 10000;

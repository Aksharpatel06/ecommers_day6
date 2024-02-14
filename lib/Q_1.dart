import 'package:flutter/material.dart';
class emiScreen extends StatefulWidget {
  const emiScreen({super.key});

  @override
  State<emiScreen> createState() => _emiScreenState();
}

class _emiScreenState extends State<emiScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff0F2027),
          appBar: AppBar(
            backgroundColor: Color(0xff0F2027),
            leading: Icon(Icons.grid_view,color: Colors.white,),
            title: Text('EMI Calculator',style: TextStyle(color: Colors.white,fontSize: 20),),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 137.0),
                          child: Text('Your loan EMI is',style: TextStyle(fontSize: 12,color: Colors.white),),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 137.0),
                          child: Text('\$emi',style: TextStyle(fontSize: 30,color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text('month',style: TextStyle(fontSize: 10,color: Colors.white),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 620,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffefefef),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(50)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Text('Loan Amount',style: TextStyle(color: Color(0xff484848),fontSize: 20,),),
                    Text('${x}',style: TextStyle(color: Color(0xff000000),fontSize: 18,),),
                    Slider(value: x,max: 1000000,min: 10000,divisions: 99, onChanged: (value){
                      setState(() {
                        x = value;
                      });
                    }),
                    SizedBox(height: 30,),
                    Text('Intrest Rate',style: TextStyle(color: Color(0xff484848),fontSize: 20,),),
                    Text('${y}%',style: TextStyle(color: Color(0xff000000),fontSize: 18,),),
                    Slider(value: y,max: 100,min: 0,divisions: 10, onChanged: (value){
                      setState(() {
                        y = value;
                      });
                    }),
                    SizedBox(height: 30,),
                    Text('Loan Tenure',style: TextStyle(color: Color(0xff484848),fontSize: 20,),),
                    Text('${z} months',style: TextStyle(color: Color(0xff000000),fontSize: 18,),),
                    Slider(value: z,max: 120,min: 0,divisions: 10, onChanged: (value){
                      setState(() {
                        z = value;
                      });
                    }),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
double x =100000;
double y=0;
double z=12;
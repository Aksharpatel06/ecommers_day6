import 'dart:math';

import 'package:flutter/material.dart';

class emiScreen extends StatefulWidget {
  const emiScreen({super.key});

  @override
  State<emiScreen> createState() => _emiScreenState();
}

double EMIAmt = 0;

class _emiScreenState extends State<emiScreen> {
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xff1F295C),
      appBar: AppBar(
        backgroundColor: Color(0xff1F295C),
        leading: Icon(
          Icons.grid_view,
          color: Colors.white,
        ),
        title: Text(
          'EMI Calculator',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 137.0),
                        child: Text(
                          'Your loan EMI is',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 120.0),
                        child: Text(
                          '₹ ${EMIAmt.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                          '/month',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: heigth * 0.78,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30), topLeft: Radius.circular(50)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: heigth * 0.075,
                  ),
                  Text(
                    'Loan Amount',
                    style: TextStyle(
                      color: Color(0xff484848),
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${p.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                    ),
                  ),
                  Slider(
                      value: p,
                      max: 1000000,
                      min: 1000,
                      divisions: 999,
                      activeColor: Colors.grey,
                      thumbColor: Color(0xff1F295C),
                      onChanged: (value) {
                        p = value;
                        setState(() {});
                      }),
                  SizedBox(
                    height: heigth * 0.06,
                  ),
                  Text(
                    'Intrest Rate',
                    style: TextStyle(
                      color: Color(0xff484848),
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${r.toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                    ),
                  ),
                  Slider(
                      value: r,
                      max: 100,
                      min: 0,
                      divisions: 10,
                      activeColor: Colors.grey,
                      thumbColor: Color(0xff1F295C),
                      onChanged: (value) {
                        r = value;
                        setState(() {});
                      }),
                  SizedBox(
                    height: heigth * 0.06,
                  ),
                  Text(
                    'Loan Tenure',
                    style: TextStyle(
                      color: Color(0xff484848),
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '${n.toStringAsFixed(0)} months',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 18,
                    ),
                  ),
                  Slider(
                      value: n,
                      max: 120,
                      min: 0,
                      divisions: 10,
                      activeColor: Colors.grey,
                      thumbColor: Color(0xff1F295C),
                      onChanged: (value) {
                        n = value;
                        setState(() {});
                      }),
                  SizedBox(
                    height: heigth * 0.06,
                  ),
                  SizedBox(
                    height: heigth * 0.08,
                    width: width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        EMIAmt = emi(p, r, n);
                        setState(() {});
                      },
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff1F295C)),
                        overlayColor:
                            MaterialStateProperty.all(Colors.grey.shade700),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

double emi(double principal, double rateOfInterest, double numberOfPayments) {
  double emi = 0;
  rateOfInterest = r / 12 / 100;
  emi = (principal *
      rateOfInterest *
      pow((1 + rateOfInterest), numberOfPayments) /
      ((pow(1 + rateOfInterest, numberOfPayments)) - 1)) as double;
  return emi;
}

double p = 100000;
double r = 10;
double n = 12;
double count = 0;

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String Output="0";
  String _out="0";
  double num1=0.0;
  double num2=0.0;
  String operand = "";
  PressedButton(String val){
    print(val);
    if(val =="C"){
      _out="0";
      num1=0;
      num2=0;
      operand="";
    }else if(val=="+"||val=="-"||val=="X"||val=="/"){
      num1=double.parse(Output);
      operand=val;
      _out = "0";
      Output=Output+val;
    }else if(val=="."){
      if(_out.contains(".")){
        return;
      }else{
        _out=_out+val;
      }
    }else if(val=="="){
      num2=double.parse(Output);
      if(operand=="+"){
        _out=(num1+num2).toString();
      }if(operand=="-"){
        _out=(num1-num2).toString();
      }if(operand=="X"){
        _out=(num1*num2).toString();
      }if(operand=="/"){
        _out=(num1/num2).toString();
      }
      num2=0.0;
      num1=0.0;
    }else{
      _out=_out+val;
    }
    setState(() {
      Output=double.parse(_out).toStringAsFixed(2);
    });
  }


  Widget CalcBtn(String Btnval){
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(4,4),
              blurRadius: 5,
              spreadRadius: 2
            ),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-2,-2),
                blurRadius: 15,
                spreadRadius: 1
            )
          ]
        ),
        child: MaterialButton(
          padding: EdgeInsets.all(30),
          child: Text(
            Btnval,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          onPressed: (){
            PressedButton(Btnval);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 50),
              child: Text(
                Output,
                style: TextStyle(
                  fontSize: 60,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    CalcBtn("."),
                    CalcBtn("C"),
                    CalcBtn("X"),
                    CalcBtn("/"),
                  ],
                ),
                Row(
                  children: [
                    CalcBtn("7"),
                    CalcBtn("8"),
                    CalcBtn("9"),
                    CalcBtn("0"),

                  ],
                ),
                Row(
                  children: [
                    CalcBtn("4"),
                    CalcBtn("5"),
                    CalcBtn("6"),
                    CalcBtn("+"),
                  ],
                ),
                Row(
                  children: [
                    CalcBtn("1"),
                    CalcBtn("2"),
                    CalcBtn("3"),
                    CalcBtn("-"),
                  ],
                ),
                Row(
                  children: [
                    CalcBtn("="),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


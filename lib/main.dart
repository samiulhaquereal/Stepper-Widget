import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _Currentstep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step'),centerTitle: true,backgroundColor: Colors.blueAccent,),
      body: Center(
        child: Stepper(
          onStepTapped: (int newIndex){
            setState(() {
              _Currentstep = newIndex;
            });
          },
          currentStep: _Currentstep,
          onStepContinue: (){
            if(_Currentstep != 2){
              setState(() {
                _Currentstep+=1;
              });
            }
          },
          onStepCancel: (){
            if(_Currentstep != 0){
              setState(() {
                _Currentstep -= 1 ;
              });
            }
          },
          type: StepperType.horizontal,
          steps: [
            Step(
                isActive: _Currentstep == 0,
                title: Text('Step 1'), content: Text('Profile')
            ),
            Step(
                isActive: _Currentstep == 1,
                title: Text('Step 2'), content: Text('Bio ')
            ),
            Step(
                isActive: _Currentstep == 2,
                title: Text('Step 3'), content: Text('Payment')
            ),
          ],
        ),
      ),
    );
  }
}


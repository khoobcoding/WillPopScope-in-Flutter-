import 'package:flutter/material.dart';

class WillPopScopePage extends StatefulWidget {
  const WillPopScopePage({super.key});

  @override
  State<WillPopScopePage> createState() => _WillPopScopePageState();
}

class _WillPopScopePageState extends State<WillPopScopePage> {
  @override
  Widget build(BuildContext context) {
    DateTime lasttimebackbuttonwaspressed=DateTime.now();
    return WillPopScope(
      onWillPop: () async{
        // return false;//stay
        // return true;//exit

        // //! Alert Dialog 
        // final dialog=await showDialog(context: context, builder:(context) {
        //   return AlertDialog(
        //     title: Text('Do you want to Go Back ?'),
        //     actions: [
        //       TextButton(onPressed: (){
        //         Navigator.pop(context,false);
        //       }, child: Text('Cancel')),
        //       TextButton(onPressed: (){
        //         Navigator.pop(context,true);
        //       }, child: Text('Yes'))
        //     ],
        //   );
        // },);
        // return dialog ?? false; //default

        // //! Going Back on double press
        // if (DateTime.now().difference(lasttimebackbuttonwaspressed)>=
        // const Duration(seconds: 2)){
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Press back button again to go back'),
        //     duration: Duration(seconds: 2),)
        //   );
        //   lasttimebackbuttonwaspressed=DateTime.now();
        //   return false;
        // }else{
        //   return true;
        // }

        //! Showing ADS
        // final dialog=await showDialog(context: context, builder:(context) {
        //   return Dialog(
        //     child: Container(height: 400,
        //     decoration: BoxDecoration(border: Border.all(color: Colors.white,
        //     width: 5)),
        //     child: Image.asset('assets/img1.png',fit: BoxFit.cover,),),
        //   );
        // },);
        // return dialog;

        if (DateTime.now().difference(lasttimebackbuttonwaspressed)>=
        const Duration(seconds: 2)){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Press back button again to go back'),
            duration: Duration(seconds: 2),)
          );
          await showDialog(context: context, builder:(context) {
          return Dialog(
            child: Container(height: 400,
            decoration: BoxDecoration(border: Border.all(color: Colors.white,
            width: 5)),
            child: Image.asset('assets/img1.png',fit: BoxFit.cover,),),
          );
        },);
          lasttimebackbuttonwaspressed=DateTime.now();
          return false;
        }else{
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text(
            'WillPopScope Page',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            final color = [
              Colors.amber,
              Colors.red,
              Colors.teal,
              Colors.deepOrange,
              const Color.fromARGB(255, 36, 129, 250),
            ];
            return Container(
              height: 200,
              color: color[index],
              child: Center(
                child: Text(
                  '${index + 1}',
                  style:
                      const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

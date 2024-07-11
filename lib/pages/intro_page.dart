import 'package:flutter/material.dart';

import 'home_page.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset("lib/images/nike.png",
              height: 200,
              ),
            ),

            const SizedBox(height: 48,),


            // title

            Text('Just Do It',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),

            const SizedBox(height: 24,),

            // subtitle

            Text('New sneakers in town made with premium quality and just for you',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                color: Colors.grey
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 48,),

            //start now btn

            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
               ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10)
                ),
              
                padding: EdgeInsets.all(25),
              
                child: Center(
                  child: const Text('Shop now',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:bookstore_app/utils/constants.dart';
import 'package:flutter/material.dart';

//TODO: Kindly ignore this file
class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 350,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(

                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios_new
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                          ),
                          child: const Center(
                            child: Icon(
                                Icons.bookmark
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  //
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Title'),
                  const SizedBox(height: 20),
                  const Text('John Abraham'),
                  const SizedBox(height: 20),
                 
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Description',
                  style: kHeaderTextStyle,
                ),
                Text('\$50')
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      const Text('QTY'),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.add, size: 20,)),
                           const Text('2'),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.remove, size: 20))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF01800D),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: const Center(
                    child: Text('Buy Now', style: TextStyle(color: Colors.white,),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:pgtstore/models/category/category.dart';
// import 'package:pgtstore/models/product/product.dart';
// import 'package:pgtstore/services/http_service.dart';



// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   HttpService httpService = HttpService();

  
 

//   Future<List<Category>> category;
 

//   Future<List<Product>> product;


//   @override
//   void initState() {
//     super.initState();
//     category = httpService.getAllCategories();
//     product = httpService.getAllProducts();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(color: Color(0xff102733)),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         Image.asset(
//                           "assets/logo.png",
//                           height: 28,
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Row(
//                           children: <Widget>[
//                             Text(
//                               "UVE",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.w800),
//                             ),
//                             Text(
//                               "UVE",
//                               style: TextStyle(
//                                   color: Color(0xffFCCD00),
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.w800),
//                             )
//                           ],
//                         ),
//                         Spacer(),
//                         Image.asset(
//                           "assets/notify.png",
//                           height: 22,
//                         ),
//                         SizedBox(
//                           width: 16,
//                         ),
//                         Image.asset(
//                           "assets/menu.png",
//                           height: 22,
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               "Hello, Sanskar!",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 21),
//                             ),
//                             SizedBox(
//                               height: 6,
//                             ),
//                             Text(
//                               "Let's explore what’s happening nearby",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 15),
//                             )
//                           ],
//                         ),
//                         Spacer(),
//                         Container(
//                           decoration: BoxDecoration(
//                             border:
//                                 Border.all(width: 3, color: Color(0xffFAE072)),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: ClipRRect(
//                               borderRadius: BorderRadius.circular(30),
//                               child: Image.asset(
//                                 "assets/profilepic.jpg",
//                                 height: 40,
//                               )),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),

//                     // /// Dates
//                     // Container(
//                     //   height: 60,
//                     //   child: ListView.builder(
//                     //       itemCount: dates.length,
//                     //       shrinkWrap: true,
//                     //       scrollDirection: Axis.horizontal,
//                     //       itemBuilder: (context, index) {
//                     //         return DateTile(
//                     //           weekDay: dates[index].weekDay,
//                     //           date: dates[index].date,
//                     //           isSelected: todayDateIs == dates[index].date,
//                     //         );
//                     //       }),
//                     // ),

//                     SizedBox(
//                       height: 16,
//                     ),
//                     Text(
//                       "All Categories",
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     Container(
//                       height: 100,
//                       child: FutureBuilder<List<Category>>(
//                           future: category,
//                           builder: (context, snapshot) {
//                             if (snapshot.hasData) {
//                               return ListView.builder(
//                                   // itemCount: snapshot.data.length,

//                                   itemCount: snapshot.data.length != null
//                                       ? snapshot.data.length
//                                       : 7,
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.horizontal,
//                                   itemBuilder: (context, index) {
//                                     Category category = snapshot.data[index];

//                                     return EventTile(
//                                       name: category.name,
//                                       imageUrl: category.image,
//                                     );
//                                   });
//                             }

//                             return Center(child: CircularProgressIndicator());
//                           }),
//                     ),

//                     /// Popular Events
//                     SizedBox(
//                       height: 16,
//                     ),
//                     Text(
//                       "Popular Products",
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                     ),
//                     Container(
//                         child: FutureBuilder<List<Product>>(
//                             future: product,
//                             builder: (context, productSnapshot) {
//                               if (productSnapshot.hasData) {
//                                 return ListView.builder(
//                                     itemCount:
//                                        productSnapshot.data.length,
                                            
//                                     shrinkWrap: true,
//                                     itemBuilder: (context, index) {
//                                       Product product =
//                                           productSnapshot.data[index];
//                                       return PopularEventTile(
//                                         name: product.name,
//                                         productImage: product.images.first.src,
//                                         regularPrice: product.regularPrice,
//                                         salePrice: product.salePrice,
//                                         category:product.categories.first.name,
//                                       );
//                                     });
//                               }
//                               return Center(child: CircularProgressIndicator());
//                             }))
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class DateTile extends StatelessWidget {
//   String weekDay;
//   String date;
//   bool isSelected;
//   DateTile({this.weekDay, this.date, this.isSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 10),
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//           color: isSelected ? Color(0xffFCCD00) : Colors.transparent,
//           borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             date,
//             style: TextStyle(
//                 color: isSelected ? Colors.black : Colors.white,
//                 fontWeight: FontWeight.w600),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             weekDay,
//             style: TextStyle(
//                 color: isSelected ? Colors.black : Colors.white,
//                 fontWeight: FontWeight.w600),
//           )
//         ],
//       ),
//     );
//   }
// }

// class EventTile extends StatelessWidget {
//   final String name;
//   final String imageUrl;
//   EventTile({this.name, this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       padding: EdgeInsets.symmetric(horizontal: 30),
//       margin: EdgeInsets.only(right: 16),
//       decoration: BoxDecoration(
//           color: Color(0xff29404E), borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Image.network(
//             imageUrl,
//             height: 27,
//           ),
//           // Image.asset(imageUrl, height: 27,),
//           SizedBox(
//             height: 12,
//           ),
//           Text(
//             name,
//             style: TextStyle(color: Colors.white),
//           )
//         ],
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class PopularEventTile extends StatelessWidget {
//   final String name;
//   final String regularPrice;
//   final String salePrice;
//   final String productImage;
//   final String category;

//   /// later can be changed with imgUrl
//   PopularEventTile(
//       {this.name, this.regularPrice, this.productImage, this.salePrice,this.category});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: 100,
//       margin: EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//           color: Color(0xff29404E), borderRadius: BorderRadius.circular(8)),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.only(left: 16),
//               width: MediaQuery.of(context).size.width - 100,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     name,
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Text(
//                         regularPrice,
//                         style: TextStyle(color: Colors.yellow, fontSize: 14,fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         width: 4,
//                       ),
//                       Text(
//                         "AED",
//                         style: TextStyle(color: Colors.yellow, fontSize: 12),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Row(
//                     children: <Widget>[
                   
//                       Text(
//                         category,
//                         style: TextStyle(color: Colors.white, fontSize: 14),
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: <Widget>[
//                    Container(
//                      child: 
//                       RaisedButton(
//                         onPressed: (){},
//                         child: Text("Add to Cart",
//                         style: TextStyle(color: Colors.black),
//                         ),
//                         color: Color(0xffFCCD00),
//         textColor: Colors.white,
//         shape: RoundedRectangleBorder(),

                      
//                       )),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           ClipRRect(
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(8),
//                   bottomRight: Radius.circular(8)),
//               child: Image.network(
//                 productImage,
//                 height: 100,
//                 width: 120,
//                 fit: BoxFit.cover,
//               )),
//         ],
//       ),
//     );
//   }
// }

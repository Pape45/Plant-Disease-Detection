import 'package:flutter/material.dart';

class HomePageFarmer extends StatefulWidget{
  const HomePageFarmer({Key? key}) : super(key: key);

  @override
  State<HomePageFarmer> createState() => _HomePageFarmerState();

}

class _HomePageFarmerState extends State<HomePageFarmer> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int selectedIndex = 1;
    Size size = MediaQuery.of(context).size;
    final List<Champ> champs = [
    Champ(
      name: 'Mon premier champ',
      photoUrl: 'assets/Arbre.jpg',
    ),
    Champ(
    name: 'Nouveau champ',
    photoUrl: 'assets/plus.jpg',
    ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             padding: const EdgeInsets.only(top: 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Container(
                   padding: const EdgeInsets.symmetric(
                     horizontal: 16.0,
                   ),
                   width: size.width * .9,
                   decoration: BoxDecoration(
                     color: Colors.grey[200],
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.search, color : Colors.black54.withOpacity(.6),),
                       const Expanded(child: TextField(
                         showCursor: false,
                         decoration: InputDecoration(
                           hintText: ' Rechercher une maladie',
                           border: InputBorder.none,
                           focusedBorder: InputBorder.none,

                         ),
                       )),
                     ],
                   ),
                 ),
               ],
             ),
           ),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 12),
             height: 50.0,
             width: size.width,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
                 itemBuilder: (BuildContext context, int index){
               return Padding(
                   padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex = index;
                    });
                  },

                ),
               );
             }),
           ),
           SizedBox(
             height: size.height * .3,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: 2,
               itemBuilder: (BuildContext context, int index){
                 return Container(
                   width: 300,
                   margin: const EdgeInsets.symmetric(horizontal: 10),
                   decoration: BoxDecoration(
                     color: Colors.green[800],
                     borderRadius: BorderRadius.circular(20),
                   ),
                   child: Stack(
                     children: [
                       Positioned(
                         left: 30,
                         right: 30,
                         top: 50,
                         bottom: 50,
                         child: Image.asset(champs[index].photoUrl),
                       ),
                       Positioned(
                            bottom: 15,
                           left: 20,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(champs[index].name, style: const TextStyle(
                                 color: Colors.white70,
                                 fontSize: 16,
                               ),),
                             ],
                           ),),
                     ],
                   ),
                 );
               }
           ),
           ),
         ],
       ),
      ),
    );
  }
}
class Champ {
  final String name;
  final String photoUrl;

  Champ({
    required this.name,
    required this.photoUrl,
  });
}

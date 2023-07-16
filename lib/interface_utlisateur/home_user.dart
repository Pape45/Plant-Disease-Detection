import 'package:flutter/material.dart';

class HomePageFarmer extends StatefulWidget {
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
   /* final List<Champ> champs = [
      Champ(
        name: 'Mon premier champ',
        photoUrl: 'assets/Arbre.jpg',
      ),
      Champ(
        name: 'Nouveau champ',
        photoUrl: 'assets/plus.jpg',
      ),
    ];
    */
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
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.no_backpack,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Bienvenue',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade900,
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 200,
                                child: Image.asset('assets/images/k2.jpg'),
                              ),
                            ],
                          ),
                        ),

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
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
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
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 300,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),

                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}


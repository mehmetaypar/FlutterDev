import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget categories({@required Color color, @required String name}) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _mainCategories({
    @required double price,
    @required String tittle,
    @required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.5),
            blurRadius: 9,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '\$',
                style: TextStyle(
                    fontSize: 27,
                    color: Color(0xff0dd7df),
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price.toString(),
                      style: TextStyle(
                        color: Color(0xff363b64),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          Text(
            tittle,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff363b64),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff363b64),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdcf1f9),
      appBar: AppBar(
        backgroundColor: Color(0xffdcf1f9),
        elevation: 0.0,
        leading: Icon(
          Icons.sort,
          size: 35,
          color: Color(0xff363b64),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(9),
            child: Center(
              child: Container(
                child: CircleAvatar(
                  maxRadius: 20,
                  backgroundColor: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                height: 220,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffdcf1f9),
                            hintText: 'Find Shoes',
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.indigo[200],
                                child: Icon(
                                  Icons.search,
                                  size: 29,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 34,
                        color: Color(0xff363b64),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        categories(color: Color(0xff363b64), name: 'Nike'),
                        categories(color: Colors.black45, name: 'Adidas'),
                        categories(color: Colors.black45, name: 'Puma'),
                        categories(color: Colors.black45, name: 'Baleciaga'),
                        categories(color: Colors.black45, name: 'Converse'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 440,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 30,
                shrinkWrap: true,
                mainAxisSpacing: 30,
                scrollDirection: Axis.horizontal,
                children: [
                  _mainCategories(
                    price: 180,
                    tittle: 'Nike jj',
                    subtitle: 'Not? Zar0.3 PF',
                  ),
                  _mainCategories(
                    price: 180,
                    tittle: 'Nike jj',
                    subtitle: 'Not? Zar0.3 PF',
                  ),
                  _mainCategories(
                    price: 180,
                    tittle: 'Nike jj',
                    subtitle: 'Not? Zar0.3 PF',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

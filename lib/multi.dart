import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas11/cart.dart';
import 'package:tugas11/money.dart';

class Multi extends StatefulWidget {
  @override
  _MultiState createState() => _MultiState();
}

class _MultiState extends State<Multi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(
            create: (context) => Money(),
          ),
          ChangeNotifierProvider<Cart>(
            create: (context) => Cart(),
          )
        ],
        child: Scaffold(
            floatingActionButton: Consumer<Money>(
              builder: (context, money, _) => Consumer<Cart>(
                builder: (context, cart, _) => FloatingActionButton(
                  onPressed: () {
                    if (money.balance >= 1000) {
                      cart.quantity += 1;
                      money.balance -= 1000;
                    }
                  },
                  child: Icon(Icons.add_shopping_cart),
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            appBar: AppBar(title: Text("Multi Page")),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Balance"),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<Money>(
                      builder: (context, money, _) => Text(
                          money.balance.toString(),
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  height: 30,
                  width: 150,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue[100],
                      border: Border.all(color: Colors.blue, width: 2)),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<Cart>(
                      builder: (context, cart, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Durian (1000) x" + cart.quantity.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700)),
                          Text((1000 * cart.quantity).toString(),
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                  height: 30,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blue, width: 2)),
                )
              ],
            )),
      ),
    );
  }
}

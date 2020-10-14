import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contra_wireframe_app/bordered_container.dart';
import 'package:flutter_contra_wireframe_app/values/assets.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'fasson',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(Assets.icDrawer),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Image.asset(Assets.icNotification),
            onPressed: () {},
          ),
        ],
      ),
      body: SuccessWidget(),
    );
  }
}

class SuccessWidget extends StatelessWidget {
  final List<Datum> listData = [
    Datum(
      name: 'Air Jordan 5 Laney JSP',
      price: '\$189',
      isAddedInWishlist: true,
      imagePath: Assets.icMaleTshirt,
      backgroundColor: Colors.red,
    ),
    Datum(
      name: 'Blazer with striped t-shirt',
      price: '\$289',
      isAddedInWishlist: false,
      imagePath: Assets.icFemaleTshirt,
      backgroundColor: Colors.yellow,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SearchWidget(),
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: listData.length,
            shrinkWrap: true,
            itemBuilder: (_, int index) => ListItem(data: listData[index]),
          ),
        ),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final Datum data;

  const ListItem({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BorderedContainer(
          fillColor: data.backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Image.asset(data.imagePath),
          width: double.maxFinite,
          height: 200,
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: Text(
                data.name,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .merge(TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            IconButton(
              icon: Image.asset(
                data.isAddedInWishlist
                    ? Assets.icHeartFilled
                    : Assets.icHeartEmpty,
              ),
              onPressed: () {},
            ),
          ],
        ),
        Text(
          data.price,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .merge(TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Image.asset(Assets.icSearch),
          hintText: 'Search with Love',
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
        ),
      ),
    );
  }
}

class Datum {
  final String name;
  final String price;
  final bool isAddedInWishlist;
  final String imagePath;
  final Color backgroundColor;

  Datum({
    this.name,
    this.price,
    this.isAddedInWishlist,
    this.imagePath,
    this.backgroundColor,
  });
}

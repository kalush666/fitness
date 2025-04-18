import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> Listcategories = [];
  List<DietModel> diets = [];

  void _getCategories() {
    Listcategories = CategoryModel.getCategories();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  void _getInitialInfo() {
    _getCategories();
    _getDiets();
  }

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchBar(),
          SizedBox(height: 40),
          categories(),
          SizedBox(height: 40),
          dietsList(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Breakfast",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: appBarLeading(),
      actions: [appBarAction()],
    );
  }

  Widget appBarLeading() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          'assets/icons/Arrow - Left 2.svg',
          height: 20,
          width: 20,
        ),
      ),
    );
  }

  Widget appBarAction() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 37,
        decoration: BoxDecoration(
          color: Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset('assets/icons/dots.svg', height: 5, width: 5),
      ),
    );
  }

  Column searchBar() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search Pancake',
              hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 14),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 0.1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Categories',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 15),
        categoriesList(),
      ],
    );
  }

  Container categoriesList() {
    return Container(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: Listcategories.length,
        padding: const EdgeInsets.only(left: 20, right: 20),
        separatorBuilder: (context, index) => const SizedBox(width: 25),
        itemBuilder: (context, index) {
          final category = Listcategories[index];
          return Container(
            width: 100,
            decoration: BoxDecoration(
              color: category.boxColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(category.iconPath),
                  ),
                ),
                Text(
                  category.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container dietItem(context, index) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
        color: diets[index].boxColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(diets[index].iconPath),
          Text(
            diets[index].name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Text(
            '${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            height: 45,
            width: 130,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  diets[index].viewIsSelected
                      ? Color(0xff9DCEFF)
                      : Colors.transparent,
                  diets[index].viewIsSelected
                      ? Color(0xff92A3FD)
                      : Colors.transparent,
                ],
              ),
              borderRadius: BorderRadius.circular(52),
            ),
            child: Center(
              child: Text(
                'View',
                style: TextStyle(
                  color:
                      diets[index].viewIsSelected
                          ? Colors.white
                          : Color(0xffc588f2),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column dietsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return dietItem(context, index);
            },
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ],
    );
  }
}

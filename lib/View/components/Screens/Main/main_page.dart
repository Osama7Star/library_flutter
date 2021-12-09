import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_new/View/components/Screens/Authors/all_authors_screen.dart';
import 'package:flutter_library_new/controller/authors_controller.dart';
import 'package:flutter_library_new/controller/book_info_controller.dart';
import 'package:flutter_library_new/controller/category_controller.dart';
import 'package:flutter_library_new/utilites/SizeConfig.dart';
import 'package:flutter_library_new/utilites/enums.dart';
import '../../components.dart';
import '../../coustme_bottom_nav_bar.dart';
import 'components/components.dart';
import 'components/getAuthorsW.dart';
import 'components/getBooksW.dart';
import 'components/getCategoriesW.dart';
import 'components/getCategorysBooks.dart';
import 'components/slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _MainPageState();

  BookInfoController _con1 = BookInfoController();
  CategoryController _con2 = CategoryController();
  AuthorController _con3 = AuthorController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: MyAppBar(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: missing_required_param
            Slider222(),
            SizedBox(height: 10),

            /// CATEGORY LABEL
            categorylabel(),

            /// START CATEGORY IS HERE
            getCategoriesW(con2: _con2),

            SizedBox(height: 40),

            /// MOST RATED
            SubText(text: AppLocalizations.of(context).most_rated),
            SizedBox(height: 5),
           getBooksW(function: _con1.fetchMostRatedBooks()),



            SizedBox(height: 35),
            GetCategoryBooks(
                categoryId: "19",
                con2: _con2,
                function: _con1.fetchCategory1Books("19")),

            /// MOST READED
            SubText(text: AppLocalizations.of(context).most_read),
            getBooksW(function: _con1.fetchMostReadedBooks()),
            // CategoryNameLabel(),
            /// AUTHOR
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllAuthorsScreen()),
                  );
                },
                child: SubText(text: AppLocalizations.of(context).authors)),
            getAuthorsW(con3: _con3),
            SizedBox(height: 15),
            GetCategoryBooks(
                categoryId: "20",
                con2: _con2,
                function: _con1.fetchCategory1Books("20")),

            //CategoryNameLabel(),
            SizedBox(height: 5),
            GetCategoryBooks(
              categoryId: "21",
              con2: _con2,
              function: _con1.fetchCategory1Books("22"),
            ),
            //CategoryNameLabel(),

            /// get the last added books
            SizedBox(height: 5),
            GetCategoryBooks(
              categoryId: "21",
              con2: _con2,
              function: _con1.fetchLastAddedBooks(),
              needForLabel: false,
            ),


          ],
        ),
      )),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      floatingActionButton: floatingActionButtonW(),
    );
  }
}

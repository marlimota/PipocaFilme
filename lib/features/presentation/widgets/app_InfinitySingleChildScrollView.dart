import 'package:flutter/material.dart';

class InfinitySingleChildScrollView extends StatefulWidget {
  final String text;
  final TextStyle style;

  const InfinitySingleChildScrollView({Key key, this.text, this.style})
      : super(key: key);

  @override
  _InfinitySingleChildScrollViewState createState() =>
      _InfinitySingleChildScrollViewState(text, style);
}

class _InfinitySingleChildScrollViewState
    extends State<InfinitySingleChildScrollView> {
  ScrollController _scrollController = new ScrollController();
  final String text;
  final TextStyle style;

  _InfinitySingleChildScrollViewState(this.text, this.style);

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      // ignore: invalid_use_of_protected_member
      if (_scrollController.positions.isNotEmpty &&
          _scrollController.position.pixels <=
              _scrollController.position.minScrollExtent) {
        animateToEnd();
      }

      double scrollLenght = _scrollController.position.extentAfter +
          _scrollController.position.extentInside +
          _scrollController.position.extentBefore;
      // ignore: invalid_use_of_protected_member
      if (_scrollController.positions.isNotEmpty &&
          _scrollController.position.pixels >= scrollLenght) {
        animateToStart();
      }
    });

    animateToEnd();
  }

  void animateToEnd() async {
    await Future.delayed(Duration(seconds: 1));
    // ignore: invalid_use_of_protected_member
    if (_scrollController.positions.isNotEmpty &&
        _scrollController.position.extentAfter > 0) {
      double scrollLenght = _scrollController.position.extentAfter +
          _scrollController.position.extentInside +
          _scrollController.position.extentBefore;
      _scrollController.animateTo(scrollLenght,
          duration: Duration(milliseconds: 6000), curve: Curves.ease);
    }
  }

  void animateToStart() async {
    await Future.delayed(Duration(seconds: 0));
    // ignore: invalid_use_of_protected_member
    if (_scrollController.positions.isNotEmpty) {
      _scrollController.animateTo(0,duration: Duration(milliseconds: 5000), curve: Curves.ease);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Text(text, style: style));
  }
}

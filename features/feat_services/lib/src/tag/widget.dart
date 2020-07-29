import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lib_lego/lib_lego.dart';
import 'package:lib_services/lib_services.dart';
import 'package:provider/provider.dart';

class ServiceTagWidget extends StatefulWidget {
  final String title;
  final String feedKey;

  const ServiceTagWidget({
    Key key,
    this.title,
    this.feedKey,
  }) : super(key: key);

  @override
  _ServiceTagWidgetState createState() => _ServiceTagWidgetState();
}

class _ServiceTagWidgetState extends State<ServiceTagWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox.fromSize(size: Size.fromHeight(5)),
        Padding(
          padding: const EdgeInsets.only(
            left: 18,
            top: 15,
            bottom: 5,
          ),
          child: Text(
            widget.title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    );
  }
}
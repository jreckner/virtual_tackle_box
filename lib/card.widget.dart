import 'package:flutter/material.dart';

class LureCard extends StatefulWidget {
  final String label;
  String description = "";
  final String imageUri;
  LureCard({Key? key, required this.label, required this.imageUri, this.description = ""}) : super(key: key);

  @override
  State<LureCard> createState() => _LureCardState();
}

class _LureCardState extends State<LureCard> {

  var buyReplacement = false;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
        title: Text(widget.label),
        subtitle: widget.description == "" ? const Text("") : Text(widget.description),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox.fromSize(
            size: const Size.fromRadius(48),
            child: Image.network(widget.imageUri),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_shopping_cart_rounded,
                color: buyReplacement ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  buyReplacement = !buyReplacement;
                });
              },
            ),
          ]
        ),
      ),
    );
  }
}
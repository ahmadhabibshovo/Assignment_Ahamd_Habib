import "package:flutter/material.dart";

Center rectImage({required String imagepath}) {
  return Center(
    child: Container(
      margin: EdgeInsets.all(35),
      child: ClipRRect(
        child: Image(
          fit: BoxFit.fill,
          image: AssetImage(imagepath),
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
    ),
  );
}

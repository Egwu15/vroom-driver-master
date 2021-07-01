import 'package:flutter/material.dart';

Container circularImage(String image, double size, ) {
  return Container(
    height: size,
    width: size,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.network(
        image,

        // loadingBuilder: (BuildContext context, Widget child,
        //     ImageChunkEvent loadingProgress) {
        //   if (loadingProgress == null) return child;
        //   return Center(
        //     child: CircularProgressIndicator(
        //       value: loadingProgress.expectedTotalBytes != null
        //           ? loadingProgress.cumulativeBytesLoaded /
        //               loadingProgress.expectedTotalBytes
        //           : null,
        //     ),
        //   );

        // },
        errorBuilder:
            (BuildContext context, Object exception, StackTrace stackTrace) {
          return Center(
            child: Icon(
              Icons.person_rounded,
              size: size - size * 0.20,
              color: Colors.black,
            ),
          );
        },
      ),
    ),
  );
}

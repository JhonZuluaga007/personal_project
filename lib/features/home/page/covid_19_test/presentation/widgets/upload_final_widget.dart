import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({Key? key, required this.size, required this.imagePath})
      : super(key: key);

  final Size size;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: size.height * 0.075,
      width: size.width * 0.25,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          BackgroundImage(
            imagePath: imagePath,
          ),
          GestureDetector(
              onTap: () {
                
              },
              child: const Icon(
                Icons.cancel,
                size: 14,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/no_image.png'),
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

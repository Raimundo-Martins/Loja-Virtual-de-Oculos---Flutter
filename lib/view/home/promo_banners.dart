import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../layout.dart';

class PromoBanners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (context, index) {
        return Container(
          foregroundDecoration: BoxDecoration(
            color: Layout.light(0),
            border: Border.all(width: 3, color: Layout.light()),
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              'assets/images/promocoes/promo-${index + 1}.png',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      autoplay: true,
      curve: Curves.easeInOutBack,
      duration: 700,
      itemCount: 3,
      pagination: new SwiperPagination(),
      scale: 0.9,
      viewportFraction: 0.85,
    );
  }
}

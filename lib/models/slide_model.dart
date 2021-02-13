import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/introscreens/Fig_Medalha.png',
    title: 'Know the best \n talents of the World.',
    description:
        'Create your profile and generate trends \n to rank with the best in the world.',
  ),
  Slide(
    imageUrl: 'assets/images/introscreens/fig_cloud.png',
    title: 'Create Funded Projects.',
    description:
        'Create projects using crowdfunding and \n make a big impact on your career or get \n your dream off the ground.',
  ),
  Slide(
    imageUrl: 'assets/images/introscreens/Fig_Mundo.png',
    title: 'Find & work in the best arts and sports companies in the world.',
    description:
        'Find the best opportunities in entertainment, arts and sports companies around the world.',
  ),
  Slide(
    imageUrl: 'assets/images/introscreens/Fig_World-live.png',
    title: 'Be sponsored by the big brands & companies all over the globe.',
    description:
        'HelloHit has open to many brands \n the oportunity to invest in talents such as: Soccer players. Singers. Track&Field athletes. Dancers and many more.',
  ),
  Slide(
    imageUrl: 'assets/images/introscreens/Fig_news.png',
    title:
        'Fans - Watch news, events, biographical series, videos, and cheer for you favorite talents.',
    description:
        'Watch the best entertainment content in arts and sports world here!',
  ),
];

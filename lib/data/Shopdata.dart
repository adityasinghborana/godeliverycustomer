import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:godelivery/models/products.dart';
import 'package:godelivery/models/shopcard.dart';
import '../models/filtermodel.dart';

RxList<shopdata> Allshopdata = [
  shopdata(
    shopid: "1",
    Shopname: "esse shop",
    imageurl: "https://source.unsplash.com/random/900%C3%97700/?coffeeshop",
    rating: 4,
    review: 210,
    price: 200,
    distance: 20,
    Sale: "10%off",
    Time: "30 mins",
    ratingtypee: "Excellent",
    items: ['american', 'italian', 'japanaese', 'italian', 'egg'],
    Products: [
      product(
          productid: "2",
          title: "Sweetgoat",
          price: 20,
          description: "description",
          url: "https://source.unsplash.com/random/900%C3%97700/?pizza")
    ],
  ),
  shopdata(
      shopid: "10",
      Shopname: "Ayush shop",
      imageurl: "https://source.unsplash.com/random/900%C3%97700/?food",
      rating: 4,
      price: 200,
      review: 210,
      distance: 21,
      Sale: "20%off",
      Time: "30 mins",
      ratingtypee: "Excellent",
      items: [
        'american',
        'italian',
        'japanaese',
        'chicken'
      ],
      Products: [
        product(
            productid: "3",
            title: "Sweetgoat",
            price: 20,
            description: "description",
            url: "https://source.unsplash.com/random/900%C3%97700/?pizza")
      ]),
  shopdata(
      shopid: "70",
      Shopname: "Aditya shop",
      imageurl: "https://source.unsplash.com/random/900%C3%97700/?pizza",
      rating: 4,
      price: 200,
      review: 210,
      distance: 23,
      Sale: "50%off",
      Time: "30 mins",
      ratingtypee: "Good",
      items: [
        'american',
        'italian',
        'japanaese',
        'burgerr'
      ],
      Products: [
        product(
            productid: "60",
            title: "Sweetgoat",
            price: 20,
            description: "description",
            url: "https://source.unsplash.com/random/900%C3%97700/?pizza")
      ]),
  shopdata(
      shopid: "22",
      Shopname: "esse shop",
      imageurl: "https://source.unsplash.com/random/900%C3%97700/?cafe",
      rating: 4,
      price: 200,
      review: 210,
      distance: 50,
      Sale: "15%off",
      Time: "30 mins",
      ratingtypee: "Average",
      items: [
        'american',
        'italian',
        'japanaese',
      ],
      Products: [
        product(
            productid: "5",
            title: "Sweetgoat",
            price: 20,
            description: "description",
            url: "https://source.unsplash.com/random/900%C3%97700/?pizza")
      ]),
  shopdata(
      shopid: "4",
      Shopname: " Ayushi shop",
      imageurl: "https://source.unsplash.com/random/900%C3%97700/?food",
      rating: 4,
      price: 200,
      review: 210,
      distance: 20,
      Sale: "10%off",
      Time: "30 mins",
      ratingtypee: "Excellent",
      items: [
        'american',
        'italian',
        'japanaese',
        'sushi',
        'burger'
      ],
      Products: [
        product(
            productid: "6",
            title: "Sweetgoat",
            price: 20,
            description: "description",
            url: "https://source.unsplash.com/random/900%C3%97700/?pizza")
      ]),
  shopdata(
      shopid: "6",
      Shopname: "Nikita shop",
      imageurl: "https://source.unsplash.com/random/900%C3%97700/?food",
      rating: 5,
      price: 400,
      review: 210,
      distance: 10,
      Sale: "10%off",
      Time: "30 mins",
      ratingtypee: "Excellent",
      items: [
        'american',
        'italian',
        'japanaese',
        'daal chawal',
        'egg'
      ],
      Products: [
        product(
            productid: "7",
            title: "Sweetgoat",
            price: 20,
            description: "description",
            url: "https://source.unsplash.com/random/900%C3%97700/?pizza")
      ]),
].obs;

List<filter> itemscat = [
  filter(
      itemnamee: "chicken",
      iconurl: "https://source.unsplash.com/random/900%C3%97700/?chicken"),
  filter(
      itemnamee: "egg",
      iconurl: "https://source.unsplash.com/random/900%C3%97700/?egg"),
  filter(
      itemnamee: "daal chawal",
      iconurl: "https://source.unsplash.com/random/900%C3%97700/?rice"),
  filter(
      itemnamee: "burgerr",
      iconurl: "https://source.unsplash.com/random/900%C3%97700/?chicken"),
  filter(
      itemnamee: "sushi",
      iconurl: "https://source.unsplash.com/random/900%C3%97700/?egg"),
  filter(
      itemnamee: "rolls",
      iconurl: "https://source.unsplash.com/random/900%C3%97700/?rice")
];

List categories = [
  {
    "title": "Restaurents",
    "description": "Lorem ipsum dolor sit amet, consectetur.",
    "color": Color.fromARGB(255, 251, 32, 16),
    "imagepath": "assets/images/burgers.png",
    "navigate": "restaurents"
  },
  {
    "title": "Groceries",
    "description": "Lorem ipsum dolor sit amet, consectetur.",
    "color": Color(0xff0EACD7),
    "imagepath": "assets/images/image197.png",
    "navigate": "restaurents"
  },
  {
    "title": "Package",
    "description": "Lorem ipsum dolor sit amet, consectetur.",
    "color": Color(0xffFC6877),
    "imagepath": "assets/images/image 200.png",
    "navigate": "restaurents"
  },
  {
    "title": "Medication",
    "description": "Lorem ipsum dolor sit amet, consectetur.",
    "color": Color(0xff0184F7),
    "imagepath": "assets/images/image 201.png",
    "navigate": "restaurents"
  },
  {
    "title": "restaurent",
    "description": "Lorem ipsum dolor sit amet, consectetur.",
    "color": Colors.red,
    "imagepath": "assets/images/burgers.png",
    "navigate": "restaurents"
  },
];

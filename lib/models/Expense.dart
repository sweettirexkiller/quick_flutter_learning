// uuid package is used to generate unique id for each expense
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

// enum category 
enum Category {
  Food,
  Travel,
  Leisure, 
  Work
}

const categoryIcons = {
  Category.Food: Icons.fastfood,
  Category.Travel: Icons.flight_takeoff,
  Category.Leisure: Icons.movie,
  Category.Work: Icons.work
};


class Expense {
  
  Expense({required this.title,required this.amount,required this.date, required this.category}) : id = uuid.v4();
  
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get icon {
    return categoryIcons[category];
  }

  String get formattedDate {
    return formatter.format(date);
  }

  // to string 
  @override
  String toString() {
    return 'Expense{id: $id, title: $title, amount: $amount, date: $date, category: $category}';
  }

}
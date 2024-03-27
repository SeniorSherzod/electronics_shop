import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';

class NewsViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<News> _newsList = [];

  List<News> get newsList => _newsList;

  // Fetch news from Firebase Firestore
  Future<void> fetchNews() async {
    try {
      final querySnapshot = await _firestore.collection('news').get();
      _newsList = querySnapshot.docs.map((doc) {
        return News.fromJson(doc.data());
      }).toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching news: $error');
    }
  }

  // Add news to Firebase Firestore
  Future<void> addNews(News news) async {
    try {
      await _firestore.collection('news').add(news.toJson());
      _newsList.add(news);
      notifyListeners();
    } catch (error) {
      print('Error adding news: $error');
    }
  }

  // Remove news from Firebase Firestore
  Future<void> removeNews(int index) async {
    try {
      final docId = _newsList[index].id;
      await _firestore.collection('news').doc(docId).delete();
      _newsList.removeAt(index);
      notifyListeners();
    } catch (error) {
      print('Error removing news: $error');
    }
  }

  // Clear all news from Firebase Firestore
  Future<void> clearNews() async {
    try {
      await _firestore.collection('news').get().then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });
      _newsList.clear();
      notifyListeners();
    } catch (error) {
      print('Error clearing news: $error');
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../model/hotel_model.dart';

// static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
// static const API_KEY = "f41ea63b8fd4434d99fe480b2382e2b9";

final hotelsProvider = FutureProvider<Hotels>((ref) async {
  http.Response? response;
  final requestUrl = Uri.parse(
      "https://app.rakuten.co.jp/services/api/Travel/KeywordHotelSearch/20170426?format=json&keyword=%E4%BA%AC%E9%83%BD&applicationId=1017540297278717275");

  response = await http.get(requestUrl);
  final responseBody = response.body;
  print("responseBody: $responseBody");

  final hotels = Hotels.fromJson(jsonDecode(responseBody));
  print("hotels: ${hotels.hotelList}");
  return hotels;
});

class HomeScreen extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Hotels> hotels = ref.watch(hotelsProvider);
    print(hotels);

    return hotels.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (hotels) {
        return ListView.builder(
          itemCount: hotels.hotelList.length,
          itemBuilder: (context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.network(
                        hotels.hotelList[index].hotelImageUrl ?? "https://jmva.or.jp/wp-content/uploads/2018/07/noimage.png"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(hotels.hotelList[index].hotelName ?? ""),
                        Text(hotels.hotelList[index].hotelSpecial ?? ""),
                        Text(hotels.hotelList[index].address2 ?? ""),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

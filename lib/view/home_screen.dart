import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/model/event_model.dart';
import 'package:future_provider/model/library.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

// static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
// static const API_KEY = "f41ea63b8fd4434d99fe480b2382e2b9";

final eventProvider = FutureProvider<List<Event>>((ref) async {
  http.Response? response;
  final requestUrl = Uri.parse("https://connpass.com/api/v1/event/");

  response = await http.get(requestUrl);
  if (response.statusCode == 200) {
    List<Library> libraries = [];
    print("通信に成功しました");
    final responseBody = response.body;

    final decodedResponse = jsonDecode(responseBody);

    // print("decodedResponse: ${decodedResponse.runtimeType}");

    // decodedResponse.forEach((key, value) {
    //   print("key: $key");
    //   print("value: ${value.runtimeType}");
    // });

    final List events = decodedResponse["events"];
    final List<Event> eventModelList = [];
    events.forEach((element) {
      // print("Element: $element");
      final event = Event.fromJson(element);
      eventModelList.add(event);
    });

    eventModelList.forEach((element) {
      print("List: $element");
    });

    return eventModelList;
  } else {
    throw ("何らかの通信エラーが発生しました:${response.statusCode}");
  }
});

class HomeScreen extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Event>> events = ref.watch(eventProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("図書館一覧"),
      ),
      body: Center(
        child: events.when(
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const Icon(Icons.tag),
                          const SizedBox(height: 2.5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data[index].hashTag ?? "ハッシュタグ",
                              style: const TextStyle(fontSize: 8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(data[index].title ?? "タイトル"),
                          const SizedBox(height: 2.5),
                          Text(data[index].abstract ?? "概要"),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

import 'package:assignment_app/pages/temple_history/const.dart';
import 'package:assignment_app/pages/temple_history/widgets/rect_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../config/themes/theme.dart';

class TempleHistory extends StatefulWidget {
  TempleHistory({
    super.key,
  });

  @override
  State<TempleHistory> createState() => _TempleHistoryState();
}

class _TempleHistoryState extends State<TempleHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temple History"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Get.changeTheme(
                    Get.isDarkMode ? lightTheme : darkTheme,
                  );
                });
              },
              icon: Icon(Get.isDarkMode ? Icons.dark_mode : Icons.sunny))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            rectImage(imagepath: "assets/images/temple_history/events.webp"),
            Text(
              "The Ram Mandir \nTimeline of events",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ReadMoreText(
                disclaimer,
                trimLines: 2,
                colorClickableText: Colors.grey,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: historyEvent["periods"]!
                    .map(
                      (e) => Card(
                        child: Column(
                          children: [
                            Text(
                              e["period"] as String,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Column(
                              children: (e["events"] as List)
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(e["text"]),
                                      ))
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: list
                    .map((e) => Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  (e as List)[0],
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: ((e as List)[1] as List)
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            e as String,
                                            textAlign: TextAlign.start,
                                          ),
                                        ))
                                    .toList(),
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

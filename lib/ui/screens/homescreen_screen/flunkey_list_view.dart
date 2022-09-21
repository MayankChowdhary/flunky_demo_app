import 'package:android_lyrics_player/data/models/flunkey_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/dipslay_snackbar.dart';

class SongListView extends StatelessWidget {
  SongListView(this.model, {super.key});

  final SongModel? model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: model?.data?.data?.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => {displaySnackbar(context, "Restaurant selected")},
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(
                        model?.data?.data[index].imageUrl ?? '',
                        height: 100,
                        width: 100,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "${model?.data?.data[index].restaurantName}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Address:${model?.data?.data[index].address}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Phone:${model?.data?.data[index].ownerMobile}",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

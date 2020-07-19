import 'package:flutter/material.dart';
import 'package:jamiee_flutter/src/providers/faqData.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:jamiee_flutter/src/styles/text.dart';
import 'package:jamiee_flutter/src/widgets/settings/appBar.dart';
import 'package:provider/provider.dart';
//TODO: FAQ PAGE PENDING

class FaqPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _faqData = Provider.of<FaqData>(context);
    return Scaffold(
      //TODO: Floating for debugging
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var data = _faqData.faqData();
          print(data.length);
          print(data[0]["title"]);
        },
      ),
      appBar: settingsAppBar(title:"FAQ's"),
      body: !_faqData.isDataLoaded
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _faqData.faqData().length,
              itemBuilder: (ctx, index) {
                var _data = _faqData.faqData();
                return ExpansionTile(
                  title: Text(
                    _data[index]["title"],
                    style: AppTextStyle.faqTitle,
                  ),
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                      child: Text(
                        _data[index]["body"],
                        style: AppTextStyle.faqSubTitle,
                      ),
                    ),
                  ],
                );
              }),
    );
  }
}

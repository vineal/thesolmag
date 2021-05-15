import 'package:the_sol_mag/models/main_feed_model.dart';
import 'api_services.dart';
import 'package:the_sol_mag/utilities/constants.dart';

class FeedList {
  Future<List<Feed>> getFeedList() async {
    String url = "${Constants.BASEURL}wp-json/wc/v3/posts";
    print(url);
    Map<String, dynamic> responseData =
        await APIService.getEndpointData(url).catchError((error) => {
              print(error.message),
            });
    MainFeed data = MainFeed.fromJson(responseData);
    return data.feed;
  }
}

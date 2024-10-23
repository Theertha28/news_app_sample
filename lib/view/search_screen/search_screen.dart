import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_sample/controller/search_screen_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenProvider = context.watch<SearchScreenController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "FlashFeed",
          style:
              GoogleFonts.urbanist(fontWeight: FontWeight.w900, fontSize: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 34,
                ),
                Positioned(
                  top: 3,
                  right: 4,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 6,
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SearchBar(
              controller: controller,
              leading: IconButton(
                  onPressed: () {
                    context
                        .read<SearchScreenController>()
                        .onSearch(controller.text);
                  },
                  icon: Icon(Icons.search)),
              onChanged: (value) {},
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Builder(builder: (context) {
                if (screenProvider.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (screenProvider.newsArticles.isEmpty) {
                  return Center(child: Text("No Data"));
                } else {
                  return Center(
                      child: ListView.separated(
                          itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CachedNetworkImage(
                                        imageUrl: screenProvider
                                            .newsArticles[index].urlToImage
                                            .toString(),
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      title: Text(
                                        screenProvider.newsArticles[index].title
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // Text(screenProvider.newsArticles[index].url.toString()),
                                    //  Text(screenProvider.newsArticles[index].source.toString(),),
                                    //  Text(screenProvider.newsArticles[index].author.toString()),
                                    // Text(screenProvider.newsArticles[index].description.toString()),
                                    // Text(screenProvider.newsArticles[index].content.toString()),
                                  ],
                                ),
                              ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: screenProvider.newsArticles.length));
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

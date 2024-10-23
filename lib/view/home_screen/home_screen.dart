import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_sample/controller/home_screen_controller.dart';
import 'package:news_app_sample/utils/default_image.dart';
import 'package:news_app_sample/view/news_detail_screen/news_detail_screen.dart';
import 'package:news_app_sample/view/saved_news_screen/saved_news_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().getTopNews();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = context.watch<HomeScreenController>();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "FlashFeed",
            style:
                GoogleFonts.urbanist(fontWeight: FontWeight.w900, fontSize: 25),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SavedNewsScreen()));
                    },
                    icon: Icon(
                      Icons.bookmark_border_outlined,
                      size: 30,
                    )),
                Padding(
                  padding: EdgeInsets.all(5),
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
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Builder(builder: (context) {
            if (homeScreenProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(builder: (context) {
                    if (homeScreenProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (homeScreenProvider.newsArticles.isEmpty) {
                      return const Center(child: Text("No articles available"));
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text("Latest News",
                                      style: GoogleFonts.urbanist(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 22,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.black,
                                          decorationThickness: 3)),
                                  Spacer(),
                                  TextButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Text(
                                            "See All",
                                            style: GoogleFonts.urbanist(
                                              fontWeight: FontWeight.w800,
                                              color: Colors.blue,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.blue,
                                            size: 20,
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            CarouselSlider.builder(
                              options: CarouselOptions(
                                  height: 230,
                                  autoPlay: true,
                                  scrollDirection: Axis.horizontal,
                                  viewportFraction: 1),
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) {
                                final article =
                                    homeScreenProvider.newsArticles[itemIndex];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 10,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            width: double.infinity,
                                            homeScreenProvider
                                                        .newsArticles[itemIndex]
                                                        .urlToImage !=
                                                    null
                                                ? homeScreenProvider
                                                    .newsArticles[itemIndex]
                                                    .urlToImage
                                                    .toString()
                                                : AppImg.newsDefaultImage,
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            child: Container(
                                              height: 400,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: SizedBox(
                                                  height: 120,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        article.author ??
                                                            "Unknown Author",
                                                        style: GoogleFonts
                                                            .urbanist(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      Text(
                                                        article.title ??
                                                            "No Title",
                                                        maxLines: 3,
                                                        style: GoogleFonts
                                                            .urbanist(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Recommendation",
                                style: GoogleFonts.urbanist(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                )),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 300,
                              child: ListView.separated(
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewsDetailScreen(
                                                  title: homeScreenProvider
                                                      .newsArticles[index].title
                                                      .toString(),
                                                  // category:homeScreenProvider.newsArticles[index].category.toString(),
                                                  publishedAt:
                                                      homeScreenProvider
                                                          .newsArticles[index]
                                                          .publishedAt
                                                          .toString(),
                                                  author: homeScreenProvider
                                                      .newsArticles[index]
                                                      .author
                                                      .toString(),
                                                  urlToImage: homeScreenProvider
                                                      .newsArticles[index].url
                                                      .toString(),
                                                  description:
                                                      homeScreenProvider
                                                          .newsArticles[index]
                                                          .description
                                                          .toString(),
                                                  content: homeScreenProvider
                                                      .newsArticles[index]
                                                      .content
                                                      .toString(),
                                                )));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 0.5, color: Colors.black)),
                                    child: ListTile(
                                      leading: CachedNetworkImage(
                                        imageUrl: homeScreenProvider
                                            .newsArticles[index].urlToImage
                                            .toString(),
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      title: Text(
                                        homeScreenProvider
                                            .newsArticles[index].title
                                            .toString(),
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 8,
                                ),
                                itemCount: 15,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            }
          }),
        ));
  }
}

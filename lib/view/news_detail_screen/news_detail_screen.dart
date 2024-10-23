import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_sample/view/saved_news_screen/saved_news_screen.dart';

class NewsDetailScreen extends StatelessWidget {
  NewsDetailScreen(
      {super.key,
      required this.content,
      required this.author,
      required this.description,
      required this.publishedAt,
      this.urlToImage,
      required this.title});
  String title;

  String publishedAt;
  String author;
  String? urlToImage;
  String description;
  String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SavedNewsScreen()));
        },
        child: Icon(Icons.bookmark_add_outlined),
      ),
      appBar: AppBar(
        title: Text(
          "FlashFeed",
          style:
              GoogleFonts.urbanist(fontWeight: FontWeight.w900, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(urlToImage.toString()),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              publishedAt,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              softWrap: false,
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              title.toString(),
              style: GoogleFonts.urbanist(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              author,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              maxLines: 3,
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              content,
              maxLines: 2,
              style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

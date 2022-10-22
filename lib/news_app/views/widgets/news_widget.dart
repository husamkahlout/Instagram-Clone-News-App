import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui/news_app/models/news_model.dart';
import 'package:instagram_ui/news_app/provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class NewsWidget extends StatelessWidget {
  NewsModel newsModel;
  NewsWidget(this.newsModel, {super.key});

  Future _launchInBrowser() async {
    launchUrl(
      Uri.parse(newsModel.url ?? ""),
      mode: LaunchMode.platformDefault,
    );
  }

  Future _callPhone() async {
    launchUrl(
      Uri(scheme: 'tel', path: '0599156475'),
    );
  }

  Future _sms() async {
      final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: '0595380910',
      queryParameters: <String, String>{
        'body': Uri.encodeQueryComponent('Example Subject & Symbols are allowed!'),
      },
    );
    launchUrl(smsLaunchUri);
  }

  Future mailTo() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  Future chatWhatsApp(String phone, String message) async{
    String url = "whatsapp://send?phone=$phone&text=${Uri.encodeFull(message)}";
    launchUrl(Uri.parse(url));
  }
  
  shareNews() {
    Share.share("check this news ${newsModel.title ?? ""}");
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => shareNews(),
      child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.12),
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Image.asset('assets/images/husam.png');
                  },
                  imageUrl: newsModel.imgUrl ?? "null",
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsModel.title ?? 'not defined',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    newsModel.description ?? 'not defined',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(newsModel.author ?? 'not defind',
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic))),
                      Consumer<HomeProvider>(
                          builder: (context, homeProvider, x) {
                        return IconButton(
                            onPressed: () {
                              homeProvider.changeLike(newsModel);
                              homeProvider.getFavouriteNews();
                            },
                            icon: Icon(
                              Icons.favorite,
                              color:
                                  newsModel.isLike ? Colors.red : Colors.grey,
                            ));
                      })
                    ],
                  )
                ],
              )),
            ],
          )),
    );
  }
}

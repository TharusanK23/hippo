import 'package:flutter/material.dart';
import 'package:hippo/routes/index.routes.dart';

class OwnUIMovie extends StatelessWidget {
  const OwnUIMovie({super.key, required this.video, required this.makeFavorite});

  final Video video;
  final Function makeFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF2F2F2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
            child: CachedNetworkImage(
              height: 150.0,
              fit: BoxFit.cover,
              width: 125.0,
              colorBlendMode: BlendMode.modulate,
              imageUrl: video.poster!,
              placeholder: (context, url) => Center(
                child: SvgPicture.asset(
                  'assets/images/placeholder.svg',
                  fit: BoxFit.cover,
                ),
              ),
              errorWidget: (context, url, error) => Center(
                child: SvgPicture.asset(
                  'assets/images/placeholder.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    video.title!,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Released on ${video.year!}",
                    style: const TextStyle(
                      color: Color(0xFF8E8E93),
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "Type: ${video.type!.toUpperCase()}",
                    style: const TextStyle(
                      color: Color(0xFF8E8E93),
                      fontSize: 13,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => makeFavorite(),
                        icon: Icon(
                          video.isLiked! ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          color: video.isLiked! ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

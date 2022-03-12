class Audios {

  String title;
  String url;
  String date;
  String image;


  Audios({required this.title, required this.url, required this.date, required this.image});

  Audios.fromJson(Map<String, dynamic> json) :

        title = json['title'],
        url = json['url'],
        date = json['date'],
        image = json['image'];


  Map<String, dynamic> toJson() => {

    'title': title,
    'url': url,
    'date': date,
    'image': image
  };

  @override
  String toString() {
    return 'Audios: { title: $title, url: $url, date: $date, image: $image}';
  }
}
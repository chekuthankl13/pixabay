

class ImageList {
  final List<ImageModel> images;

  ImageList({required this.images});

  factory ImageList.fromJson(Map<String,dynamic>json)=> ImageList(images:List<ImageModel>.from((json['hits'] as List).map((e)=>ImageModel.fromJSon(e)).toList(),), );
}




class ImageModel {
  final String id;
  final String image;
  final String likes;
  final String views;

  ImageModel({required this.id, required this.image, required this.likes, required this.views});

  factory ImageModel.fromJSon(Map<String,dynamic>json)=>ImageModel(id: json['id'].toString(), image: json['webformatURL'], likes: json['likes'].toString(), views: json['views'].toString());
}



//  {
//       "id": 3082832,
//       "pageURL": "https://pixabay.com/photos/nature-waters-lake-island-3082832/",
//       "type": "photo",
//       "tags": "nature, waters, lake",
//       "previewURL": "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_150.jpg",
//       "previewWidth": 150,
//       "previewHeight": 84,
//       "webformatURL": "https://pixabay.com/get/g15bd8e80062fdabd2db503a3ccbc48f329dc5148ddbe40b77420a80d47766b0e8993db0adafb2b481c7aa592dfaffc8b9f83abc25b4195d436c0b718d2be2da1_640.jpg",
//       "webformatWidth": 640,
//       "webformatHeight": 359,
//       "largeImageURL": "https://pixabay.com/get/gafa27eff1b91909a979d047aa49aecc327a676f5e0c602d84ad73d095908e6d285e9dd88387cb30e4e4592c35aff74da5f9bc06ed3f44cedfe7b1050ad158950_1280.jpg",
//       "imageWidth": 5757,
//       "imageHeight": 3238,
//       "imageSize": 4638828,
//       "views": 6995325,
//       "downloads": 4278430,
//       "collections": 186068,
//       "likes": 5129,
//       "comments": 747,
//       "user_id": 7645255,
//       "user": "jplenio",
//       "userImageURL": "https://cdn.pixabay.com/user/2024/06/10/13-43-32-848_250x250.jpg"
//     },
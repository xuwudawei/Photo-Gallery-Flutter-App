class ImageModel{
  String url;
  String id;
  String title;
  ImageModel(this.id,this.url,this.title);
  ImageModel.fromJson(parsedJson){
    id=parsedJson['id'];
    url=parsedJson['download_url'];
    title=parsedJson['title'];
  }
}
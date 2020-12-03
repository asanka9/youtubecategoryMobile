class Video {

  String url;
  String name;

  Video(this.name,this.url);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'url': url,
      'name':name
    };
    return map;
  }

  Video.fromMap(Map<String, dynamic> map) {
    url = map['url'];
    name = map['name'];
  }

  String getName(){
    return name;
  }

  String getUrl(){
    return url;
  }

  void setName(String n){
    name = n;
  }

  void setUrl(String u){
    url = u;
  }
}
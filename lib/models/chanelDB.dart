class Chanel {
  String name;
  String photoURL;
  int selected;

  Chanel( this.name,this.photoURL);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'p_url':photoURL,
      'selected':selected
    };
    return map;
  }

  Chanel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    photoURL = map['p_url'];
  }


  String getUrl(){
    return photoURL;
  }

  void setUrl(String url){
    photoURL = url;
  }

  void setName(String n){
    name = n;
  }

  String getName(){
    return name;
  }






}
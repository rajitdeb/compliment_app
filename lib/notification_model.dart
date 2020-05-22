class noti_model{
  String image;
  String text;

  noti_model({this.image,this.text});

  Map<String,dynamic >toJson(){
    var map=<String,dynamic>{
      'image':image,
      'text':text,
    };
    return map;
  }
}
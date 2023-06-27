class NotiModel{
  final String image;
  final String text;

  NotiModel({required this.image,required this.text});

  Map<String,dynamic >toJson(){
    var map=<String,dynamic>{
      'image':image,
      'text':text,
    };
    return map;
  }
}
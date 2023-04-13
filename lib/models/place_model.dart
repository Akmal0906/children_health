class PlaceModel {
  late String str1;
  late String str2;

  PlaceModel({required this.str1, required this.str2});

  PlaceModel.from(Map<String, dynamic> json)
      : str1 = json['str1'],
        str2 = json['str2'];

  Map<String, dynamic> toJson() {
    return {'str1': str1, 'str2': str2};
  }
}

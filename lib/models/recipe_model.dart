class Recipe {
  final String dishName;
  final String uid;
  final String photo;
  final String ingredients;
  final String personaltouch;
  
  //final List<dynamic> steps;

  Recipe({
    required this.dishName,
    required this.uid,
    required this.photo,
    required this.ingredients,
    required this.personaltouch,
    
  });

  Map<String, dynamic> toMap() {
    return {
      'dishName': dishName,
      'uid': uid,
      'photo': photo,
      'ingredients': ingredients,
      'personaltouch': personaltouch,
      
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
        dishName: map['dishName'] ?? '',
        uid: map['uid'] ?? '',
        photo: map['photo'] ?? '',
        ingredients: map['ingredients'] ?? '',
        personaltouch: map['personaltouch'] ?? '',
       );
  }
}

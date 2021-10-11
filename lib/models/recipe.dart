class Recipe {
  String title = "";
  String image = "";
  String lot = "";
  String timeCook = "";
  String howDoes = "";

  Recipe({
    this.title = "",
    this.image = "",
    this.lot = "",
    this.timeCook = "",
    this.howDoes = ""});

  Recipe.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    lot = json['lot'];
    timeCook = json['time_cook'];
    howDoes = json['how_does'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['lot'] = this.lot;
    data['time_cook'] = this.timeCook;
    data['how_does'] = this.howDoes;
    return data;
  }
}
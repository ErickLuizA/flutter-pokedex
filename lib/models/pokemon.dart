class Pokemon {
  List forms;
  List types;
  List abilities;
  List stats;
  Object species;
  int experience;
  int weight;
  int height;
  String name;
  String image;

  Pokemon(
      {this.types,
      this.forms,
      this.abilities,
      this.stats,
      this.species,
      this.experience,
      this.weight,
      this.height,
      this.name,
      this.image});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      forms: json['forms'],
      types: json['types'],
      abilities: json['abilities'],
      stats: json['stats'],
      species: json['species'],
      experience: json['base_experience'],
      weight: json['weight'],
      height: json['height'],
      name: json['name'],
      image: json['sprites']['front_default'],
    );
  }
}

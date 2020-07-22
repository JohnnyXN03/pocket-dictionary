class Meaning {
  String word;
  List<Meanings> meanings;

  Meaning({this.word, this.meanings});

  Meaning.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    if (json['meanings'] != null) {
      meanings = new List<Meanings>();
      json['meanings'].forEach((v) {
        meanings.add(new Meanings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word'] = this.word;
    if (this.meanings != null) {
      data['meanings'] = this.meanings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meanings {
  String partOfSpeech;
  List<Definitions> definitions;

  Meanings({this.partOfSpeech, this.definitions});

  Meanings.fromJson(Map<String, dynamic> json) {
    partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      definitions = new List<Definitions>();
      json['definitions'].forEach((v) {
        definitions.add(new Definitions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partOfSpeech'] = this.partOfSpeech;
    if (this.definitions != null) {
      data['definitions'] = this.definitions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Definitions {
  String definition;
  String example;
  List<String> synonyms;

  Definitions({this.definition, this.example, this.synonyms});

  Definitions.fromJson(Map<String, dynamic> json) {
    definition = json['definition'];
    example = json['example'];
    synonyms = json['synonyms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['definition'] = this.definition;
    data['example'] = this.example;
    data['synonyms'] = this.synonyms;
    return data;
  }
}
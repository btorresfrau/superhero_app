// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class SuperheroModel {
    SuperheroModel({
        required this.id,
        required this.name,
        this.slug,
        this.powerstats,
        this.appearance,
        this.biography,
        this.work,
        this.connections,
        this.images,
    });

    final int id;
    final String name;
    final String? slug;
    final Powerstats? powerstats;
    final Appearance? appearance;
    final Biography? biography;
    final Work? work;
    final Connections? connections;
    final Images? images;

    factory SuperheroModel.fromJson(String str) => SuperheroModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SuperheroModel.fromMap(Map<String, dynamic> json) => SuperheroModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        powerstats: json["powerstats"] == null ? null : Powerstats.fromMap(json["powerstats"]),
        images: json["images"] == null ? null : Images.fromMap(json["images"]),
        appearance: json["appearance"] == null ? null : Appearance.fromMap(json["appearance"]),
        biography: json["biography"] == null ? null : Biography.fromMap(json["biography"]),
        work: json["work"] == null ? null : Work.fromMap(json["work"]),
        connections: json["connections"] == null ? null : Connections.fromMap(json["connections"])
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug == null ? null : slug,
        "powerstats": powerstats == null ? null : powerstats!.toMap(),
        "appearance": appearance == null ? null : appearance!.toMap(),
        "biography": biography == null ? null : biography!.toMap(),
        "work": work == null ? null : work!.toMap(),
        "connections": connections == null ? null : connections!.toMap(),
        "images": images == null ? null : images!.toMap(),
    };
}

class Appearance {
    Appearance({
        this.gender,
        this.race,
        this.height,
        this.weight,
        this.eyeColor,
        this.hairColor,
    });

    final String? gender;
    final String? race;
    final List<String>? height;
    final List<String>? weight;
    final String? eyeColor;
    final String? hairColor;

    factory Appearance.fromJson(String str) => Appearance.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Appearance.fromMap(Map<String, dynamic> json) => Appearance(
        gender: json["gender"] == null ? null : json["gender"],
        race: json["race"] == null ? null : json["race"],
        height: json["height"] == null ? null : List<String>.from(json["height"].map((x) => x)),
        weight: json["weight"] == null ? null : List<String>.from(json["weight"].map((x) => x)),
        eyeColor: json["eyeColor"] == null ? null : json["eyeColor"],
        hairColor: json["hairColor"] == null ? null : json["hairColor"],
    );

    Map<String, dynamic> toMap() => {
        "gender": gender == null ? null : gender,
        "race": race == null ? null : race,
        "height": height == null ? null : List<dynamic>.from(height!.map((x) => x)),
        "weight": weight == null ? null : List<dynamic>.from(weight!.map((x) => x)),
        "eyeColor": eyeColor == null ? null : eyeColor,
        "hairColor": hairColor == null ? null : hairColor,
    };
}

class Biography {
    Biography({
        this.fullName,
        this.alterEgos,
        this.aliases,
        this.placeOfBirth,
        this.firstAppearance,
        this.publisher,
        this.alignment,
    });

    final String? fullName;
    final String? alterEgos;
    final List<String>? aliases;
    final String? placeOfBirth;
    final String? firstAppearance;
    final String? publisher;
    final String? alignment;

    factory Biography.fromJson(String str) => Biography.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Biography.fromMap(Map<String, dynamic> json) => Biography(
        fullName: json["fullName"] == null ? null : json["fullName"],
        alterEgos: json["alterEgos"] == null ? null : json["alterEgos"],
        aliases: json["aliases"] == null ? null : List<String>.from(json["aliases"].map((x) => x)),
        placeOfBirth: json["placeOfBirth"] == null ? null : json["placeOfBirth"],
        firstAppearance: json["firstAppearance"] == null ? null : json["firstAppearance"],
        publisher: json["publisher"] == null ? null : json["publisher"],
        alignment: json["alignment"] == null ? null : json["alignment"],
    );

    Map<String, dynamic> toMap() => {
        "fullName": fullName == null ? null : fullName,
        "alterEgos": alterEgos == null ? null : alterEgos,
        "aliases": aliases == null ? null : List<dynamic>.from(aliases!.map((x) => x)),
        "placeOfBirth": placeOfBirth == null ? null : placeOfBirth,
        "firstAppearance": firstAppearance == null ? null : firstAppearance,
        "publisher": publisher == null ? null : publisher,
        "alignment": alignment == null ? null : alignment,
    };
}

class Connections {
    Connections({
        this.groupAffiliation,
        this.relatives,
    });

    final String? groupAffiliation;
    final String? relatives;

    factory Connections.fromJson(String str) => Connections.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Connections.fromMap(Map<String, dynamic> json) => Connections(
        groupAffiliation: json["groupAffiliation"] == null ? null : json["groupAffiliation"],
        relatives: json["relatives"] == null ? null : json["relatives"],
    );

    Map<String, dynamic> toMap() => {
        "groupAffiliation": groupAffiliation == null ? null : groupAffiliation,
        "relatives": relatives == null ? null : relatives,
    };
}

class Images {
    Images({
        this.xs,
        this.sm,
        this.md,
        this.lg,
    });

    final String? xs;
    final String? sm;
    final String? md;
    final String? lg;

    factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Images.fromMap(Map<String, dynamic> json) => Images(
        xs: json["xs"] == null ? null : json["xs"],
        sm: json["sm"] == null ? null : json["sm"],
        md: json["md"] == null ? null : json["md"],
        lg: json["lg"] == null ? null : json["lg"],
    );

    Map<String, dynamic> toMap() => {
        "xs": xs == null ? null : xs,
        "sm": sm == null ? null : sm,
        "md": md == null ? null : md,
        "lg": lg == null ? null : lg,
    };
}

class Powerstats {
    Powerstats({
        this.intelligence,
        this.strength,
        this.speed,
        this.durability,
        this.power,
        this.combat,
    });

    final int? intelligence;
    final int? strength;
    final int? speed;
    final int? durability;
    final int? power;
    final int? combat;

    factory Powerstats.fromJson(String str) => Powerstats.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Powerstats.fromMap(Map<String, dynamic> json) => Powerstats(
        intelligence: json["intelligence"] == null ? null : json["intelligence"],
        strength: json["strength"] == null ? null : json["strength"],
        speed: json["speed"] == null ? null : json["speed"],
        durability: json["durability"] == null ? null : json["durability"],
        power: json["power"] == null ? null : json["power"],
        combat: json["combat"] == null ? null : json["combat"],
    );

    Map<String, dynamic> toMap() => {
        "intelligence": intelligence == null ? null : intelligence,
        "strength": strength == null ? null : strength,
        "speed": speed == null ? null : speed,
        "durability": durability == null ? null : durability,
        "power": power == null ? null : power,
        "combat": combat == null ? null : combat,
    };
}

class Work {
    Work({
        this.occupation,
        this.base,
    });

    final String? occupation;
    final String? base;

    factory Work.fromJson(String str) => Work.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Work.fromMap(Map<String, dynamic> json) => Work(
        occupation: json["occupation"] == null ? null : json["occupation"],
        base: json["base"] == null ? null : json["base"],
    );

    Map<String, dynamic> toMap() => {
        "occupation": occupation == null ? null : occupation,
        "base": base == null ? null : base,
    };
}

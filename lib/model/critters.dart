enum Critter {
  cat(
    emojis: [
      '🐱', '🐈', '🐈‍⬛',
    ],
    label: 'Cat',
  ),
  chicken(
    emojis: [
      '🐤', '🐣', '🐥',

    ],
    label: 'Chicken',
  ),
  chipmunk(
    emojis: [
      '🐿️',
    ],
    label: 'Chipmunk'
  ),
  dog(
    emojis: [
      '🐶', '🐕', '🦮', '🐕‍🦺',
      '🐩',
    ],
    label: 'Dog',
  ),
  fox(
    emojis: [
      '🦊',
    ],
    label: 'Fox',
  ),
  monkey(
    emojis: [
      '🐒', '🐵'
    ],
    label: 'Monkey',
  ),
  mouse(
    emojis: [
      '🐭', '🐁',
    ],
    label: 'Mouse',
  ),
  rabbit(
    emojis: [
      '🐰', '🐇',
    ],
    label: 'Rabbit',
  ),
  racoon(
    emojis: [
      '🦝',
    ],
    label: 'Racoon',
  ),
  skunk(
    emojis: [
      '🦨',
    ],
    label: 'Skunk',
  ),
  wolf(
    emojis: [
      '🐺',
    ],
    label: 'Wolf',
  )
  ;

 const Critter({
   required this.emojis,
   required this.label,
  });

 final List<String> emojis;
 final String label;

 List<Critter> get looksLike {
  switch (this) {
    case Critter.chicken:
      return [ Critter.chicken, ];
    case Critter.dog:
    case Critter.wolf:
      return [ Critter.dog, Critter.wolf, ];
    case Critter.monkey:
      return [ Critter.monkey, ];
    case Critter.mouse:
      return [ Critter.mouse, ];
    case Critter.fox:
    case Critter.racoon:
    case Critter.skunk:
      return [ Critter.fox, Critter.racoon, Critter.skunk, ];
    case Critter.cat:
      return [ Critter.cat, ];
    case Critter.chipmunk:
    case Critter.rabbit:
      return [ Critter.rabbit, ];
  }
 }
}
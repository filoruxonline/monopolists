# monopolists
Monopolists game engine.
This is part of a Flutter project.
All data that should be saved must extend HiveObject with all the decorators.
Look [here](https://docs.hivedb.dev/#/custom-objects/type_adapters) for more information on Hive.

To get started look in the test folder.

To add an extension follow the following actions:
  1) Add to the extensions enum [/engine/extensions/extensions.dart](../../tree/master/engine/kernel/extensions/extensions.dart)
  2) Add these methods to class:
    1)Widget icon(double size)
    2)List<Info> getInfo()
    3)Constructor: Check Game.data.extensions.contains(Extension.$extension)
      Add listeners to events: Game.events.add($GameEevent,$Function)
  3) Construct class in launch method in [/engine/main.dart](../../tree/master/engine/kernel/main.dart)

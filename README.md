# monopolists
Monopolists game engine.
This is part of a Flutter project.
All data that should be saved must extend HiveObject with all the decorators.
Look [here](https://docs.hivedb.dev/#/custom-objects/type_adapters) for more information on Hive.

To get started look in the [test folder](../../tree/master/engine/test/engine_test.dart).

To add an extension follow the following actions:
  1) Add to the extensions enum [/engine/extensions/extensions.dart](../../tree/master/engine/kernel/extensions/extensions.dart)
  2) Add these methods to class:\
    I) static Widget icon(double size)\
    II) static List<Info> getInfo()\
    III) static get bool enabled
  3) Construct class in launch method in [/engine/main.dart](../../tree/master/engine/kernel/main.dart)

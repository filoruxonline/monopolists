import 'package:flutter_test/flutter_test.dart';

import '../data/main.dart';
import '../kernel/core_actions.dart';
import '../kernel/main.dart';

void main() {
  test('Normal test game', () {
    Game.testing = true;
    Game.loadGame(GameData());
    Game.setup.addPlayer();
    Game.setup.addPlayer();
    Game.setup.addPlayer();
    Game.launch();

    Game.move(1, 2);
    Game.act.pay(payType.pot, 100);
    Game.next();

    expect(Game.data.currentPlayer, 1);
    expect(Game.data.players.length, 3);

    Game.move(4, 1);
    Game.act.buy();

    expect(Game.data.player.properties[0], 5);

    Game.next();
    Game.move(2, 2);
    Game.next();
    Game.move(2, 2);
    Game.next();
    Game.move(2, 2);
    expect(Game.data.player.jailed, true);
    expect(Game.data.currentPlayer, 2);

    Game.act.deal(amount: 200, receiveProperties: [5], dealer: 1);
    Game.next();
    Game.move(16, 1);
  });
}

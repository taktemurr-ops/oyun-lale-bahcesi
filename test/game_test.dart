import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_lale_bahcesi/oyun_lale_bahcesi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(laleBahcesiConfig.title.length, 33);
    expect(laleBahcesiConfig.tagline.length, 33);
    for (final s in laleBahcesiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(laleBahcesiConfig.gameId, laleBahcesiId);
    expect(laleBahcesiRules.gameId, laleBahcesiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(laleBahcesiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: laleBahcesiId, optionalMechanics: laleBahcesiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(laleBahcesiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}

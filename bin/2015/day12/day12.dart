import 'dart:async';
import 'dart:convert';

import 'package:aoc2015/runnable.dart';

class Y2015Day12 implements Runnable {
  Map<String, dynamic> json = {};

  @override
  FutureOr<void> init(Stream<String> input,
      {List<String> args = const []}) async {
    var raw = await input.join();
    json = jsonDecode(raw);
  }

  num reduce(dynamic v) {
    if (v is num) return v;
    if (v is String) return num.tryParse(v) ?? 0;
    if (v is List) return v.fold(0, (agg, value) => agg + reduce(value));
    if (v is Map) return reduce(v.values.toList());

    return 0;
  }

  @override
  FutureOr<void> part1() {
    final reduced = reduce(json);

    print('Reduced: $reduced');
  }

  @override
  FutureOr<void> part2() {}
}

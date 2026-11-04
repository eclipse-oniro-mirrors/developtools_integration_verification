/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0301: Can't resolve array type"
---*/

'use strict';
{


// We use g(a, b, c) instead of [a, b, c] when we care about Sminess being
// preserved.
function* g(...args) { for (const x of args) { yield x; } }
// G is like g but triggers GC to avoid allocation-site updates.
function* g(...args) { ArkTools.gc(); for (const x of args) { ArkTools.gc(); yield x; }; ArkTools.gc(); }


arktest.assertEQ([], [...[]]);
arktest.assertEQ([], [...[], ]);
arktest.assertEQ([1], [1, ...[]]);
arktest.assertEQ([1, 2], [1, ...[], 2]);
arktest.assertEQ([, ], [, ...[]]);
arktest.assertEQ([, ], [, ...[], ]);
arktest.assertEQ([, ], [, ...[],...[]]);
arktest.assertEQ([, ], [, ...[],...[], ]);
arktest.assertEQ([1, 2, 3], [...[1, 2, 3]]);
arktest.assertEQ([1, 1.5], [...g(1, 1.5)]);
arktest.assertEQ([, 1, 1.5], [, ...g(1, 1.5)]);
arktest.assertEQ([1, 2, 2.5, 3.5], [...g(1, 2, 2.5, 3.5)]);
arktest.assertEQ([2.5, 1, 3.5, 4], [...g(2.5, 1, 3.5, 4)]);
arktest.assertEQ([2.5, 3.5, 1, 4], [...g(2.5, 3.5, 1, 4)]);
arktest.assertEQ([{a: 1}, {b: 2}], [...[{a: 1}, {b: 2}]]);
arktest.assertEQ([0, {a: 1}, {b: 2}], [...g(0, {a: 1}, {b: 2})]);
arktest.assertEQ([1, 1.5, '2'], [...g(1, 1.5, '2')]);


function f1(x) {
  return [...[x, x, x]];
}
arktest.assertEQ([1, 1, 1], f1(1));
arktest.assertEQ([0.1, 0.1, 0.1], f1(0.1));
arktest.assertEQ([{}, {}, {}], f1({}));
arktest.assertEQ([1, 1, 1], f1(1));

function f1(x) {
  return [...[x, x, x]];
}
ArkTools.prepareFunctionForOptimization(f1);
arktest.assertEQ([1, 1, 1], f1(1));
ArkTools.optimizeFunctionOnNextCall(f1);
arktest.assertEQ([1, 1, 1], f1(1));
arktest.assertEQ([0.1, 0.1, 0.1], f1(0.1));
arktest.assertEQ([{}, {}, {}], f1({}));
arktest.assertEQ([1, 1, 1], f1(1));


function f2(x) {
  return [...[x, x, x], ,];
}
arktest.assertEQ([1, 1, 1, ,], f2(1));
arktest.assertEQ([0.1, 0.1, 0.1, ,], f2(0.1));
arktest.assertEQ([{}, {}, {}, ,], f2({}));
arktest.assertEQ([1, 1, 1, ,], f2(1));

function f2(x) {
  return [...[x, x, x], ,];
}
ArkTools.prepareFunctionForOptimization(f2);
arktest.assertEQ([1, 1, 1, ,], f2(1));
ArkTools.optimizeFunctionOnNextCall(f2);
arktest.assertEQ([1, 1, 1, ,], f2(1));
arktest.assertEQ([0.1, 0.1, 0.1, ,], f2(0.1));
arktest.assertEQ([{}, {}, {}, ,], f2({}));
arktest.assertEQ([1, 1, 1, ,], f2(1));


function f3(it) {
  return [...it, ,];
}
arktest.assertEQ([1, 0.1, '1', , ], f3(g(1, 0.1, '1')));
arktest.assertEQ([{}, 0.1, '1', , ], f3(g({}, 0.1, '1')));
arktest.assertEQ([0, 0, 0, , ], f3(g(0, 0, 0)));
arktest.assertEQ([1, 0.1, '1', , ], f3(g(1, 0.1, '1')));

function f3(it) {
  return [...it, ,];
}
ArkTools.prepareFunctionForOptimization(f3);
arktest.assertEQ([1, 0.1, '1', , ], f3(g(1, 0.1, '1')));
ArkTools.optimizeFunctionOnNextCall(f3);
arktest.assertEQ([1, 0.1, '1', , ], f3(g(1, 0.1, '1')));
arktest.assertEQ([{}, 0.1, '1', , ], f3(g({}, 0.1, '1')));
arktest.assertEQ([0, 0, 0, , ], f3(g(0, 0, 0)));
arktest.assertEQ([1, 0.1, '1', , ], f3(g(1, 0.1, '1')));


function f4(x) {
  return [...[x, x, x]];
}
arktest.assertEQ([1, 1, 1], f4(1));
arktest.assertEQ([0.1, 0.1, 0.1], f4(0.1));
arktest.assertEQ([{}, {}, {}], f4({}));
arktest.assertEQ([1, 1, 1], f4(1));

function f4(x) {
  return [...[x, x, x]];
}
ArkTools.prepareFunctionForOptimization(f4);
arktest.assertEQ([1, 1, 1], f4(1));
ArkTools.optimizeFunctionOnNextCall(f4);
arktest.assertEQ([1, 1, 1], f4(1));
arktest.assertEQ([0.1, 0.1, 0.1], f4(0.1));
arktest.assertEQ([{}, {}, {}], f4({}));
arktest.assertEQ([1, 1, 1], f4(1));


function f5(x) {
  return [...[x, x, x], ,];
}
arktest.assertEQ([1, 1, 1, ,], f5(1));
arktest.assertEQ([0.1, 0.1, 0.1, ,], f5(0.1));
arktest.assertEQ([{}, {}, {}, ,], f5({}));
arktest.assertEQ([1, 1, 1, ,], f5(1));

function f5(x) {
  return [...[x, x, x], ,];
}
ArkTools.prepareFunctionForOptimization(f5);
arktest.assertEQ([1, 1, 1, ,], f5(1));
ArkTools.optimizeFunctionOnNextCall(f5);
arktest.assertEQ([1, 1, 1, ,], f5(1));
arktest.assertEQ([0.1, 0.1, 0.1, ,], f5(0.1));
arktest.assertEQ([{}, {}, {}, ,], f5({}));
arktest.assertEQ([1, 1, 1, ,], f5(1));


function f6(it) {
  return [...it, ,];
}
arktest.assertEQ([1, 0.1, '1', , ], f6(g(1, 0.1, '1')));
arktest.assertEQ([{}, 0.1, '1', , ], f6(g({}, 0.1, '1')));
arktest.assertEQ([0, 0, 0, , ], f6(g(0, 0, 0)));
arktest.assertEQ([1, 0.1, '1', , ], f6(g(1, 0.1, '1')));

function f6(it) {
  return [...it, ,];
}
ArkTools.prepareFunctionForOptimization(f6);
arktest.assertEQ([1, 0.1, '1', , ], f6(g(1, 0.1, '1')));
ArkTools.optimizeFunctionOnNextCall(f6);
arktest.assertEQ([1, 0.1, '1', , ], f6(g(1, 0.1, '1')));
arktest.assertEQ([{}, 0.1, '1', , ], f6(g({}, 0.1, '1')));
arktest.assertEQ([0, 0, 0, , ], f6(g(0, 0, 0)));
arktest.assertEQ([1, 0.1, '1', , ], f6(g(1, 0.1, '1')));


function f7(it) {
  return [...it];
}
arktest.assertEQ([1, 0.1, '1'], f7(g(1, 0.1, '1')));
arktest.assertEQ([{}, 0.1, '1'], f7(g({}, 0.1, '1')));
arktest.assertEQ([0, 0, 0], f7(g(0, 0, 0)));
arktest.assertEQ([1, 0.1, '1'], f7(g(1, 0.1, '1')));

function f7(it) {
  return [...it];
}
ArkTools.prepareFunctionForOptimization(f7);
arktest.assertEQ([1, 0.1, '1'], f7(g(1, 0.1, '1')));
ArkTools.optimizeFunctionOnNextCall(f7);
arktest.assertEQ([1, 0.1, '1'], f7(g(1, 0.1, '1')));
arktest.assertEQ([{}, 0.1, '1'], f7(g({}, 0.1, '1')));
arktest.assertEQ([0, 0, 0], f7(g(0, 0, 0)));
arktest.assertEQ([1, 0.1, '1'], f7(g(1, 0.1, '1')));


function f8(it) {
  return [...it, ,];
}
arktest.assertEQ([1, 0.1, '1', , ], f8(g(1, 0.1, '1')));
arktest.assertEQ([{}, 0.1, '1', , ], f8(g({}, 0.1, '1')));
arktest.assertEQ([0, 0, 0, , ], f8(g(0, 0, 0)));
arktest.assertEQ([1, 0.1, '1', , ], f8(g(1, 0.1, '1')));

function f8(it) {
  return [...it, ,];
}
ArkTools.prepareFunctionForOptimization(f8);
arktest.assertEQ([1, 0.1, '1', , ], f8(g(1, 0.1, '1')));
ArkTools.optimizeFunctionOnNextCall(f8);
arktest.assertEQ([1, 0.1, '1', , ], f8(g(1, 0.1, '1')));
arktest.assertEQ([{}, 0.1, '1', , ], f8(g({}, 0.1, '1')));
arktest.assertEQ([0, 0, 0, , ], f8(g(0, 0, 0)));
arktest.assertEQ([1, 0.1, '1', , ], f8(g(1, 0.1, '1')));


// Megamorphic
function* f9() {
  for (let i = 0; i < 160000; ++i) { yield i; }
}
ArkTools.prepareFunctionForOptimization(f9);
let a = [...f9()];
arktest.assertEQ(160000, a.length);
arktest.assertEQ(0, a[0]);
arktest.assertEQ(159999, a[159999]);
ArkTools.optimizeFunctionOnNextCall(f9);
a = [...f9()];
arktest.assertEQ(160000, a.length);
arktest.assertEQ(0, a[0]);
arktest.assertEQ(159999, a[159999]);

// Slow stub
function f10(b) {
  let x = [
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ...b];
  return x.length;
}
ArkTools.prepareFunctionForOptimization(f10);
arktest.assertEQ(4335, f10([3.3, 3.3, 3.3]));
arktest.assertEQ(4335, f10([{}, '', 3.3]));
ArkTools.optimizeFunctionOnNextCall(f10);
arktest.assertEQ(4335, f10([{}, '', 3.3]));
arktest.assertEQ(4332, f10([]));


}  // top-level scope

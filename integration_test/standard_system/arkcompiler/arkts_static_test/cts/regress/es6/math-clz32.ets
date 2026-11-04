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
expected_out_1: "Semantic error ESE0062: need to specify target type for class composite"
---*/

[NaN, Infinity, -Infinity, 0, -0, 'abc', 'Infinity', '-Infinity', {}].forEach(
  function(x) {
    arktest.assertEQ(32, Math.clz32(x));
  }
);

function testclz(x) {
  for (let i = 0; i < 33; i++) {
    if (x & 0x80000000) { return i; }
    x <<= 1;
  }
  return 32;
}


function f(e) {
  const max = Math.pow(2, e);
  for (let x = 0; x < max; x = x * 1.01 + 1) {
    arktest.assertEQ(testclz(x), Math.clz32(x));
    arktest.assertEQ(testclz(-x), Math.clz32(-x));
    arktest.assertEQ(testclz(x), Math.clz32({ valueOf: function() { return x; } }));
    arktest.assertEQ(testclz(-x),
                 Math.clz32({ toString: function() { return -x; } }));
  }
}

ArkTools.prepareFunctionForOptimization(f);
f(5);
f(5);
ArkTools.optimizeFunctionOnNextCall(f);
f(40);

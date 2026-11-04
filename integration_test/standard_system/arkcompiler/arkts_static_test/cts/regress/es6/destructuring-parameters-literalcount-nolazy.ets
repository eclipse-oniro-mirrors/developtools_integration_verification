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
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function f({value}: Object): int { return value; }

//


const t1 = [1];
const t2 = [2];
const t3 = [3];
const t4 = [4];
const t5 = [5];
function g({x = {a:10,b:20}},
           {y = [1,2,3],
            n = [],
            p = /abc/}) {
  arktest.assertEQ(10, x.a);
  arktest.assertEQ(20, x.b);
  arktest.assertEQ(2, y[1]);
  arktest.assertEQ(0, n.length);
  arktest.assertTrue(p.test('abc'));
}
ArkTools.prepareFunctionForOptimization(g);
g({},{});
ArkTools.optimizeFunctionOnNextCall(g);
g({},{});


const h = ({x = {a:10,b:20}},
         {y = [1,2,3],
          n = [],
          p = /abc/ }) => {
    arktest.assertEQ(10, x.a);
    arktest.assertEQ(20, x.b);
    arktest.assertEQ(2, y[1]);
    arktest.assertEQ(0, n.length);
    arktest.assertTrue(p.test('abc'));
  };
ArkTools.prepareFunctionForOptimization(h);
h({},{});
ArkTools.optimizeFunctionOnNextCall(h);
h({},{});

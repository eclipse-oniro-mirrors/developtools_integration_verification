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
expected_out_1: "Semantic error ESE0174: Cannot infer type for o1 because class composite needs an explicit target type"
---*/

const o1 = {x:1};
const o2 = {};
let deoptGetter = false;
let deoptSetter = false;

function fMono(o) {
  return 5 + o.x++;
}
ArkTools.prepareFunctionForOptimization(fMono);

let toDeopt = fMono;

let v = 1;
let g = 0;
let s = 0;

Object.defineProperty(o2, 'x',
    {get:function() {
       g++;
       if (deoptGetter) {
         deoptGetter = false;
         ArkTools.deoptimizeFunction(toDeopt);
       }
       return v;
     },
     set:function(newV) {
       v = newV;
       s++;
       if (deoptSetter) {
         deoptSetter = false;
         ArkTools.deoptimizeFunction(toDeopt);
       }
     }});

arktest.assertEQ(6, fMono(o2));
arktest.assertEQ(1, g);
arktest.assertEQ(1, s);
arktest.assertEQ(7, fMono(o2));
arktest.assertEQ(2, g);
arktest.assertEQ(2, s);
ArkTools.optimizeFunctionOnNextCall(fMono);
deoptSetter = true;
arktest.assertEQ(8, fMono(o2));
arktest.assertEQ(3, g);
arktest.assertEQ(3, s);

function fPoly(o) {
  return 5 + o.x++;
}
ArkTools.prepareFunctionForOptimization(fPoly);

v = 1;
toDeopt = fPoly;

fPoly(o1);
fPoly(o1);
arktest.assertEQ(6, fPoly(o2));
arktest.assertEQ(4, g);
arktest.assertEQ(4, s);
arktest.assertEQ(7, fPoly(o2));
arktest.assertEQ(5, g);
arktest.assertEQ(5, s);
ArkTools.optimizeFunctionOnNextCall(fPoly);
deoptSetter = true;
arktest.assertEQ(8, fPoly(o2));
arktest.assertEQ(6, g);
arktest.assertEQ(6, s);

ArkTools.prepareFunctionForOptimization(fPoly);
ArkTools.optimizeFunctionOnNextCall(fPoly);
v = undefined;
arktest.assertEQ(7, g);
arktest.assertEQ(7, s);

function fPre(o) {
  return 5 + ++o.x;
}
ArkTools.prepareFunctionForOptimization(fPre);

v = 1;
toDeopt = fPre;

fPre(o1);
fPre(o1);
arktest.assertEQ(7, fPre(o2));
arktest.assertEQ(8, g);
arktest.assertEQ(8, s);
arktest.assertEQ(8, fPre(o2));
arktest.assertEQ(9, g);
arktest.assertEQ(9, s);
ArkTools.optimizeFunctionOnNextCall(fPre);
deoptSetter = true;
arktest.assertEQ(9, fPre(o2));
arktest.assertEQ(10, g);
arktest.assertEQ(10, s);

ArkTools.prepareFunctionForOptimization(fPre);
ArkTools.optimizeFunctionOnNextCall(fPre);
v = undefined;
arktest.assertEQ(11, g);
arktest.assertEQ(11, s);


function fGet(o) {
  return 5 + o.x++;
}
ArkTools.prepareFunctionForOptimization(fGet);

v = 1;
toDeopt = fGet;

fGet(o1);
fGet(o1);
arktest.assertEQ(6, fGet(o2));
arktest.assertEQ(12, g);
arktest.assertEQ(12, s);
arktest.assertEQ(7, fGet(o2));
arktest.assertEQ(13, g);
arktest.assertEQ(13, s);
ArkTools.optimizeFunctionOnNextCall(fGet);
deoptGetter = true;
arktest.assertEQ(8, fGet(o2));
arktest.assertEQ(14, g);
arktest.assertEQ(14, s);

ArkTools.prepareFunctionForOptimization(fGet);
ArkTools.optimizeFunctionOnNextCall(fGet);
v = undefined;
arktest.assertEQ(15, g);
arktest.assertEQ(15, s);

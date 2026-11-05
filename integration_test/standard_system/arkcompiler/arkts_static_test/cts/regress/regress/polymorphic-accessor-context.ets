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
expected_out_1: "Semantic error ESE0203: Cannot reference 'this' in this context."
---*/

function t1() {
  return this instanceof t1;
}
function t2() {
  return this instanceof t2;
}

const o1 = new function() {}();
Object.defineProperty(o1, 't', {
  get: function() {
    return this instanceof o1.constructor;
  }
});
const o2 = new function() {}();
Object.defineProperty(o2, 't', {
  get: function() {
    return this instanceof o1.constructor;
  }
});
const o3 = new function() {}();
o3.t = true;

function f(o) {
  return 1 + (o.t ? 1 : 2);
};
ArkTools.prepareFunctionForOptimization(f);
f(o1);
f(o1);
f(o2);
ArkTools.optimizeFunctionOnNextCall(f);
f(o3);

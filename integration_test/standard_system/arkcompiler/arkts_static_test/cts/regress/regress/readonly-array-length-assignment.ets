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

let a = [];
Object.defineProperty(a, 'length', {writable: false});
function f() {
  return a.pop();
}
arktest.expectThrow((): void => { f(); }, (e: Error): boolean =>
  e instanceof TypeError && /Cannot assign to read only property/.test(e.message));

ArkTools.prepareFunctionForOptimization(f);
for (let i = 0; i < 3; i++) {
  arktest.expectThrow((): void => { f(); }, (e: Error): boolean =>
    e instanceof TypeError && /Cannot assign to read only property/.test(e.message));
}
ArkTools.optimizeFunctionOnNextCall(f);
arktest.expectThrow((): void => { f(); }, (e: Error): boolean =>
  e instanceof TypeError && /Cannot assign to read only property/.test(e.message));

(() => {
function opt(){
  const v0 = [];
  let v1 = Infinity;
  const v2 = v1.E;
  for (let v5 = -1; v5 > v0; v5 = v5 & -1) {
    for (let v6 = v5; v6 <= -1; v6 = v6 + v2) {
      const v7 = v1++;
      for (let v9 = v6; v9 <= v7; v9 = v9 + v5) {
      }
    }
  }
}

ArkTools.prepareFunctionForOptimization(opt);
ArkTools.optimizeFunctionOnNextCall(opt);
let jitA2 = opt();
})();

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
expected_out_1: "Semantic error ESE0127: No matching call signature for setUint8(BigInt, Int)"
---*/

function opt() {
  const buffer = new ArrayBuffer(64);
  const view = new DataView(buffer);
  let i = 1n;
  i += 1n;
  view.setUint8(i, 0);
}

ArkTools.prepareFunctionForOptimization(opt);
arktest.expectThrow((): void => { opt(); }, (e: Error): boolean => e instanceof TypeError);
ArkTools.optimizeFunctionOnNextCall(opt);
arktest.expectThrow((): void => { opt(); }, (e: Error): boolean => e instanceof TypeError);

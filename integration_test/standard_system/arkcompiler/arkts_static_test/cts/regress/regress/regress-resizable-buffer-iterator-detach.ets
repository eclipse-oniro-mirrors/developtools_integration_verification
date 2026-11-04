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
expected_out_1: "Semantic error ESE0127: No matching construct signature for std.core.ArrayBuffer(Double, Double)"
---*/

function getKeys() {
  const buffer = new ArrayBuffer(12, { maxByteLength: 4096 });
  const u16array = new Uint16Array(buffer, 0, 5);
  buffer.resize();
  let keys = 'none';
  try {
    keys = u16array.keys();
  } catch (e) {}
  return keys;
}

(function () {
  // Testing array.prototype.keys
  ArkTools.prepareFunctionForOptimization(getKeys);
  let interpreted = getKeys();
  arktest.assertEQ('none', interpreted);
  ArkTools.optimizeFunctionOnNextCall(getKeys);
  let optimized = getKeys();
  arktest.assertEQ('none', optimized);
})();

function getValues() {
  const buffer = new ArrayBuffer(12, { maxByteLength: 4096 });
  const u16array = new Uint16Array(buffer, 0, 5);
  buffer.resize();
  let keys = 'none';
  try {
    keys = u16array.values();
  } catch (e) {}
  return keys;
}

(function () {
  // Testing array.prototype.values
  ArkTools.prepareFunctionForOptimization(getValues);
  let interpreted = getValues();
  arktest.assertEQ('none', interpreted);
  ArkTools.optimizeFunctionOnNextCall(getValues);
  let optimized = getValues();
  arktest.assertEQ('none', optimized);
})();

function getEntries() {
  const buffer = new ArrayBuffer(12, { maxByteLength: 4096 });
  const u16array = new Uint16Array(buffer, 0, 5);
  buffer.resize();
  let keys = 'none';
  try {
    keys = u16array.entries();
  } catch (e) {}
  return keys;
}

(function () {
  // Testing array.prototype.entries
  ArkTools.prepareFunctionForOptimization(getEntries);
  let interpreted = getEntries();
  arktest.assertEQ('none', interpreted);
  ArkTools.optimizeFunctionOnNextCall(getEntries);
  let optimized = getEntries();
  arktest.assertEQ('none', optimized);
})();

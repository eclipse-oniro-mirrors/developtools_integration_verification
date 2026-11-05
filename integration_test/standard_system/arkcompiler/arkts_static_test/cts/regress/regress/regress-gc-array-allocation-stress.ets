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
expected_out_1: "Syntax error ESY0135: Nested functions are not allowed."
---*/

function main() {
  function f0() {
    try {
      let v0 = 0;
    } catch (v3) { }
    try {
      let v1 = new Array(23);
    } catch (v4) { }
    try {
      for (; v0 < v1.length; v0++) {
        v1[v0] = new Uint32Array(262142);
        v1[v0] = new Uint32Array(262139);
        v1[v0] = new Uint32Array(262139);
      }
    } catch (v5) { }
    v0 = -13;
    try {
      const v2 = [];
    } catch (v6) { }
    try {
      let v1 = new Array(23);
    } catch (v7) { }
    try {
      v2.xxx = 'xxx';
    } catch (e) { }
    try {
      for (let v0 = 0; v0 < 1024; v0++) {
        v2[v0] = new Array(v0);
        v2[v0] = new Array(v0);
        v2[v0] = new Array(v0);
        v2[v0].xxx = 'xxx ' + v0;
        v2[v0].xxx = 'xxx ' + v0;
        v2[v0].xxx = 'xxx ' + v0;
      }
    } catch (vEight) { }
    try {
      ArkTools.gc();
      a(900000)[b(b(900000), 900000)] = 900000;
    } catch (v9) { }
  }
  ArkTools.gc();
  f0();
}
main();
main();
main();

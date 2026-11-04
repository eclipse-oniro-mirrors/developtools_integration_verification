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

function f1( v9) {
  return arguments;
}

let v48 = [];
let v49 = f1();
const v50 = 3;
Object.preventExtensions(v49);
function f7(v52, v53, v54) {
  v52[v53] =
  v54;
}
v48.__proto__ = v49;
for (let v51 = 0; v51 < v50; v51++) {
  f7(v48, v51);
}

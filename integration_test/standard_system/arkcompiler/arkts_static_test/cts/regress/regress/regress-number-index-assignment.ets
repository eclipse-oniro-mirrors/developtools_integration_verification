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
expected_out_1: "Semantic error ESE0250: Object type doesn't have proper index access method."
---*/

let x: number = 0;
x[0] = 0;
x[0] = 1;
x[0] = 2;

(() => {
let v2: int = 1073741823;
let v13: Object = {};
function f1(a: string, b: string): string {
  let v4: string = a + b;
  let v1: string = v4.substring(20);
  v2[v4];
  return v1;
}

let v5: string = f1('abcdefghijklmnopqrstuvwxyz', 'abcdefghijklmnopqrstuvwxyz');
function f8(name: string, input: string, regexp: Object): void {
  let v14: Any = input.match(regexp);
  RegExp["$'"];
}
f8('CaptureGlobal', v5, v13, []['anama']);
})();

(() => {
function f0(a: string): string {
  let v3: string = a + undefined;
  let v0: string = v3.substring(0, 20);
  let v1: Object = {};
  v1[v3];
  return v0;
}
let v4: string = f0('abcdefghijklmnopqrstuvwxyz');
arktest.assertEQ('bcdefg', v4.substring(7, 1));
})();

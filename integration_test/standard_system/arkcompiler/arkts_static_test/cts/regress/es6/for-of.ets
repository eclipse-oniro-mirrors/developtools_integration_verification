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
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function TestForOfName() {
  let result = 0;
  let index;

  for (index of [1, 2, 3, 4, 5]) { result += index; }

  arktest.assertEQ(result, 15);
  arktest.assertEQ(index, 5);
})();


(function TestForOfProperty() {
  let O = {};
  let result = 0;

  for (O.index of [1, 2, 3, 4, 5]) { result += O.index; }

  arktest.assertEQ(result, 15);
  arktest.assertEQ(O.index, 5);
})();

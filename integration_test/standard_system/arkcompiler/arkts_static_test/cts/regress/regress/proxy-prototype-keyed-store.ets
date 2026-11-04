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

// Define an object with a getter and a proxy as it's prototype.

/*---
tags: [compile-only, negative]
expected_out_1: >-
  "Semantic error ESE0174: Cannot infer type for obj because class composite needs an explicit target type"
---*/

let obj = {foo: 'bar'};
Object.defineProperty(obj, 'foo', {
  get: function () {
  }
});
obj.__proto__ = new Proxy([], {});

// Get key from a function to avoid the property access turning into a
// named property access.
function getKey() {
  return 'values'
}

// Keyed access to update obj's values property.
obj[getKey()] = 1;

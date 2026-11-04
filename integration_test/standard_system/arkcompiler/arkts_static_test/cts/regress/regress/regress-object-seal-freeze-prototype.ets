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


// seal then freeze.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function () {
  const v1 = Object.seal(Object);
  const v3 = Object();
  const v4 = Object(Object);
  v3.__proto__ = v4;
  const v6 = Object.freeze(Object);
})();

// preventExtensions then freeze.
(function () {
  const v1 = Object.preventExtensions(Object);
  const v3 = Object();
  const v4 = Object(Object);
  v3.__proto__ = v4;
  const v6 = Object.freeze(Object);
})();

// preventExtensions then seal.
(function () {
  const v1 = Object.preventExtensions(Object);
  const v3 = Object();
  const v4 = Object(Object);
  v3.__proto__ = v4;
  const v6 = Object.seal(Object);
})();

// freeze.
(function () {
  const v3 = Object();
  const v4 = Object(Object);
  v3.__proto__ = v4;
  const v6 = Object.freeze(Object);
})();

// seal.
(function () {
  const v3 = Object();
  const v4 = Object(Object);
  v3.__proto__ = v4;
  const v6 = Object.seal(Object);
})();

// preventExtensions.
(function () {
  const v3 = Object();
  const v4 = Object(Object);
  v3.__proto__ = v4;
  const v6 = Object.preventExtensions(Object);
})();

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

(function () {
  ((d, e = d) => {
    return d * e;
  })();
})();

try {
  (function () {
    ((d, e = f, f = d) => {
      // Won't get here as the initializers will cause a ReferenceError
    })();
  })();
  arktest.assertTrue(false);
} catch (ex) {
  arktest.assertTrue(ex instanceof ReferenceError);
  // Not using assertThrows because we need to access ex.stack to force
  // collection of source positions.
  print(ex.stack);
}

// Check that spreads in arrow functions work
(function () {
  ((...args) => args)();
})();

(() => {
(function() {
  ((x = 1) => {
    function foo() {
      x;
    }
    return x;
  })();
})();
})();

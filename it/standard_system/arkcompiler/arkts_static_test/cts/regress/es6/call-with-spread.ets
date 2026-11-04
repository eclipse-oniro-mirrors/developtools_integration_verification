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

(function() {
  'use strict';

  function testBaselineAndOpt(func) {
    ArkTools.prepareFunctionForOptimization(func);
    func(-1, -2);
    func(-1, -2);
    ArkTools.optimizeFunctionOnNextCall(func);
    return func(-1, -2);
  }

  // Rest parameters

  function restMax(...args) {
    return Math.max(...args);
  }

  let r = testBaselineAndOpt(function(x, y) {
    return restMax(x, y);
  });
  arktest.assertEQ(r, -1);

  function restMaxWithZero(...args) {
    return Math.max(0, ...args);
  }

  let r = testBaselineAndOpt(function(x, y) {
    return restMaxWithZero(x, y);
  });
  arktest.assertEQ(r, 0);

  function restMaxOneArg(x, ...args) {
    return Math.max(-10, ...args);
  }

  r = testBaselineAndOpt(function(x, y) {
    return restMaxOneArg(x, y);
  });
  arktest.assertEQ(r, -2);

  // Strict Arguments Object

  function argumentsMax() {
    return Math.max(...arguments);
  }

  let r = testBaselineAndOpt(function(x, y) {
    return argumentsMax(x, y);
  });
  arktest.assertEQ(r, -1);

  function argumentsMaxWithZero() {
    return Math.max(0, ...arguments);
  }

  let r = testBaselineAndOpt(function(x, y) {
    return argumentsMaxWithZero(x, y);
  });
  arktest.assertEQ(r, 0);

  function argumentsMaxOneArg(x) {
    return Math.max(-10, ...arguments);
  }

  let r = testBaselineAndOpt(function(x, y) {
    return argumentsMaxOneArg(x, y);
  });
  arktest.assertEQ(r, -1);

})();

(function() {
  function testBaselineAndOpt(func) {
    ArkTools.prepareFunctionForOptimization(func);
    func(-1, -2);
    func(-1, -2);
    ArkTools.optimizeFunctionOnNextCall(func);
    return func(-1, -2);
  }

  // Sloppy Arguments Object

  function argumentsMax() {
    return Math.max(...arguments);
  }

  let r = testBaselineAndOpt(function(x, y) {
    return argumentsMax(x, y);
  });
  arktest.assertEQ(r, -1);

  function argumentsMaxWithZero() {
    return Math.max(0, ...arguments);
  }

  let r = testBaselineAndOpt(function(x, y) {
    return argumentsMaxWithZero(x, y);
  });
  arktest.assertEQ(r, 0);

  function argumentsMaxOneArg(x) {
    return Math.max(-10, ...arguments);
  }

  let r = testBaselineAndOpt(function(x, y) {
    return argumentsMaxOneArg(x, y);
  });
  arktest.assertEQ(r, -1);
})();

(() => {
(function modifyNext() {
  'use strict';

  let a = [];
  let ai = a[Symbol.iterator]();

  const originalNext = ai.__proto__['next'];

  function maxWithZero(...args) {
    return Math.max(0, ...args);
  }

  function testMax(x, y) {
    return maxWithZero(x, y);
  }

  ArkTools.prepareFunctionForOptimization(testMax);
  testMax(1, 2);
  testMax(1, 2);
  ArkTools.optimizeFunctionOnNextCall(testMax);
  let r = testMax(1, 2);

  arktest.assertEQ(2, r);

  let called = 0;
  Object.defineProperty(ai.__proto__, 'next', {
    get: function() {
      called++;
      return originalNext;
    }
  });

  let r2 = testMax(1, 2);

  arktest.assertEQ(1, called);
  arktest.assertEQ(2, r2);
})();
})();

(() => {
(function modifyArrayIterator() {
  'use strict';

  function maxWithZero(...args) {
    return Math.max(0, ...args);
  }

  function testMax(x, y) {
    return maxWithZero(x, y);
  }

  ArkTools.prepareFunctionForOptimization(testMax);
  testMax(1, 2);
  testMax(1, 2);
  ArkTools.optimizeFunctionOnNextCall(testMax);
  let r = testMax(1, 2);

  arktest.assertEQ(2, r);

  Object.defineProperty(Array.prototype, Symbol.iterator, {
    value: function*
        () {
          yield 3;
          yield 4;
        },
    configurable: true
  });

  let r2 = testMax(1, 2);

  arktest.assertEQ(4, r2);
})();
})();

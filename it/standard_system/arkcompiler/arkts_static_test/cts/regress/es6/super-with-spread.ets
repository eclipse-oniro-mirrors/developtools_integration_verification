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

  class Point {
    constructor(x, y) {
      this.x = x;
      this.y = y;
    }
  }

  function testBaselineAndOpt(func) {
    ArkTools.prepareFunctionForOptimization(func);
    func(1, 2);
    func(1, 2);
    ArkTools.optimizeFunctionOnNextCall(func);
    return func(1, 2);
  }

  class RestPoint extends Point {
    constructor(...args) {
      super(...args);
    }
  }
  let r = testBaselineAndOpt(function(x, y) {
    return new RestPoint(x, y);
  });
  arktest.assertTrue(r instanceof RestPoint);
  arktest.assertTrue(r instanceof Point);
  arktest.assertEQ(r.x, 1);
  arktest.assertEQ(r.y, 2);

  class RestExtraPoint extends Point {
    constructor(...args) {
      super(-1, 0, ...args);
    }
  }
  r = testBaselineAndOpt(function(x, y) {
    return new RestExtraPoint(x, y);
  });
  arktest.assertTrue(r instanceof RestExtraPoint);
  arktest.assertTrue(r instanceof Point);
  arktest.assertEQ(r.x, -1);
  arktest.assertEQ(r.y, 0);

  class ArgumentsPoint extends Point {
    constructor() {
      super(...arguments);
    }
  }
  r = testBaselineAndOpt(function(x, y) {
    return new ArgumentsPoint(x, y);
  });
  arktest.assertTrue(r instanceof ArgumentsPoint);
  arktest.assertTrue(r instanceof Point);
  arktest.assertEQ(r.x, 1);
  arktest.assertEQ(r.y, 2);

  class ArgumentsExtraPoint extends Point {
    constructor() {
      super(1, 2, ...arguments);
    }
  }
  r = testBaselineAndOpt(function(x, y) {
    return new ArgumentsExtraPoint(x, y);
  });
  arktest.assertTrue(r instanceof ArgumentsExtraPoint);
  arktest.assertTrue(r instanceof Point);
  arktest.assertEQ(r.x, 1);
  arktest.assertEQ(r.y, 2);

  class LiteralPoint extends Point {
    constructor() {
      super(...[3, 4]);
    }
  }
  r = testBaselineAndOpt(function(x, y) {
    return new LiteralPoint(x, y);
  });
  arktest.assertTrue(r instanceof LiteralPoint);
  arktest.assertTrue(r instanceof Point);
  arktest.assertEQ(r.x, 3);
  arktest.assertEQ(r.y, 4);
})();

(() => {
(function modifyNext() {
  'use strict';

  class Point {
    constructor(x, y) {
      this.x = x;
      this.y = y;
    }
  }

  class ArgumentsPoint extends Point {
    constructor() {
      super(...arguments);
    }
  }

  let a = [];
  let ai = a[Symbol.iterator]();

  const originalNext = ai.__proto__['next'];

  function testArgumentsPoint(x, y) {
    return new ArgumentsPoint(x, y);
  }
  ArkTools.prepareFunctionForOptimization(testArgumentsPoint);
  testArgumentsPoint(1, 2);
  testArgumentsPoint(1, 2);
  ArkTools.optimizeFunctionOnNextCall(testArgumentsPoint);
  let r = testArgumentsPoint(1, 2);

  arktest.assertTrue(r instanceof ArgumentsPoint);
  arktest.assertTrue(r instanceof Point);
  arktest.assertEQ(r.x, 1);
  arktest.assertEQ(r.y, 2);

  let called = 0;
  Object.defineProperty(ai.__proto__, 'next', {
    get: function() {
      called++;
      return originalNext;
    }
  });

  let r2 = testArgumentsPoint(1, 2);

  arktest.assertEQ(1, called);
  arktest.assertTrue(r2 instanceof ArgumentsPoint);
  arktest.assertTrue(r2 instanceof Point);
  arktest.assertEQ(r2.x, 1);
  arktest.assertEQ(r2.y, 2);
})();
})();

(() => {
(function modifyArrayIterator() {
  'use strict';

  class Point {
    constructor(x, y) {
      this.x = x;
      this.y = y;
    }
  }

  class RestPoint extends Point {
    constructor(...args) {
      super(...args);
    }
  }

  function testRestPoint(x, y) {
    return new RestPoint(x, y);
  }
  ArkTools.prepareFunctionForOptimization(testRestPoint);
  testRestPoint(1, 2);
  testRestPoint(1, 2);
  ArkTools.optimizeFunctionOnNextCall(testRestPoint);
  let r = testRestPoint(1, 2);

  arktest.assertTrue(r instanceof RestPoint);
  arktest.assertTrue(r instanceof Point);
  arktest.assertEQ(1, r.x);
  arktest.assertEQ(2, r.y);

  Object.defineProperty(Array.prototype, Symbol.iterator, {
    value: function*
        () {
          yield 3;
          yield 4;
        },
    configurable: true
  });

  let r2 = testRestPoint(1, 2);

  arktest.assertTrue(r2 instanceof RestPoint);
  arktest.assertTrue(r2 instanceof Point);
  arktest.assertEQ(3, r2.x);
  arktest.assertEQ(4, r2.y);
})();
})();

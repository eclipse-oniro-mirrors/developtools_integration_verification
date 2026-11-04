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

(function testInFunctionDeclaration() {
  let calls = 0;
  function F() {
    (() => {
      calls++;
      arktest.assertEQ(2, arguments.length);
      arktest.assertEQ('a', arguments[0]);
      arktest.assertEQ('b', arguments[1]);
    })();
  }
  F('a', 'b');
  arktest.assertEQ(1, calls);

  calls = 0;
  new F('a', 'b');
  arktest.assertEQ(1, calls);
})();


(function testInFunctionExpression() {
  let calls = 0;
  let F = function() {
    (() => {
      calls++;
      arktest.assertEQ(2, arguments.length);
      arktest.assertEQ('a', arguments[0]);
      arktest.assertEQ('b', arguments[1]);
    })();
  }
  F('a', 'b');
  arktest.assertEQ(1, calls);
})();


(function testInConstructor() {
  'use strict';

  let calls = 0;
  class C {
    constructor() {
      (() => {
        calls++;
        arktest.assertEQ(2, arguments.length);
        arktest.assertEQ('a', arguments[0]);
        arktest.assertEQ('b', arguments[1]);
      })();
    }
  }
  new C('a', 'b');
  arktest.assertEQ(1, calls);
})();


(function testInSetter() {
  'use strict';

  let calls = 0;
  const o = {
    set x(_) {
      (() => {
        calls++;
        arktest.assertEQ(1, arguments.length);
        arktest.assertEQ('a', arguments[0]);
      })();
    }
  }
  o.x = 'a';
  arktest.assertEQ(1, calls);
})();


(function testMappedArguments() {
  let calls = 0;
  function F(x) {
    x = 'c';
    (() => {
      calls++;
      arktest.assertEQ(2, arguments.length);
      arktest.assertEQ('c', arguments[0]);
      x = 'a';
      arktest.assertEQ('a', arguments[0]);
      arktest.assertEQ('b', arguments[1]);
    })();
  }
  F('a', 'b');
  arktest.assertEQ(1, calls);
})();


(function testUnMappedArguments() {
  'use strict';

  let calls = 0;
  function F(x) {
    x = 'c';
    (() => {
      calls++;
      arktest.assertEQ(2, arguments.length);
      arktest.assertEQ('a', arguments[0]);
      arktest.assertEQ('b', arguments[1]);
    })();
  }
  F('a', 'b');
  arktest.assertEQ(1, calls);
})();


(function testClosure() {
  let calls = 0;
  function F(x) {
    return () => {
      calls++;
      arktest.assertEQ(2, arguments.length);
      arktest.assertEQ('a', arguments[0]);
      arktest.assertEQ('b', arguments[1]);
    };
  }
  F('a', 'b')();
  arktest.assertEQ(1, calls);
})();


(function testClosureMappedArguments() {
  let calls = 0;
  function F(x) {
    x = 'c';
    return () => {
      calls++;
      arktest.assertEQ(2, arguments.length);
      arktest.assertEQ('c', arguments[0]);
      x = 'a';
      arktest.assertEQ('a', arguments[0]);
      arktest.assertEQ('b', arguments[1]);
    };
  }
  F('a', 'b')();
  arktest.assertEQ(1, calls);
})();


(function testParamNamedArguments() {
  let calls = 0;
  function F(arguments) {
    (() => {
      calls++;
      arktest.assertEQ('a', arguments);
    })();
  }
  F('a');
  arktest.assertEQ(1, calls);
})();

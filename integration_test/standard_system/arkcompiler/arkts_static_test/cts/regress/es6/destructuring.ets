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

(function TestObjectLiteralPattern() {
  let { x : x, y : y, get, set } = { x : 1, y : 2, get: 3, set: 4 };
  arktest.assertEQ(1, x);
  arktest.assertEQ(2, y);
  arktest.assertEQ(3, get);
  arktest.assertEQ(4, set);

  let {z} = { z : 3 };
  arktest.assertEQ(3, z);


  let sum = 0;
  for (let {z} = { z : 3 }; z != 0; z--) {
    sum += z;
  }
  arktest.assertEQ(6, sum);


  let log = [];
  let o = {
    get x() {
      log.push('x');
      return 0;
    },
    get y() {
      log.push('y');
      return {
        get z() { log.push('z'); return 1; }
      }
    }
  };
  let { x : x0, y : { z : z1 }, x : x1 } = o;
  arktest.assertEQ(0, x0);
  arktest.assertEQ(1, z1);
  arktest.assertEQ(0, x1);
  arktest.assertEQ(['x', 'y', 'z', 'x'], log);
}());


(function TestObjectLiteralPatternInitializers() {
  let { x : x, y : y = 2 } = { x : 1 };
  arktest.assertEQ(1, x);
  arktest.assertEQ(2, y);

  let {z = 3} = {};
  arktest.assertEQ(3, z);

  let sum = 0;
  for (let {z = 3} = {}; z != 0; z--) {
    sum += z;
  }
  arktest.assertEQ(6, sum);

  let log = [];
  let o = {
    get x() {
      log.push('x');
      return undefined;
    },
    get y() {
      log.push('y');
      return {
        get z() { log.push('z'); return undefined; }
      }
    }
  };
  let { x : x0 = 0, y : { z : z1 = 1}, x : x1 = 0} = o;
  arktest.assertEQ(0, x0);
  arktest.assertEQ(1, z1);
  arktest.assertEQ(0, x1);
  arktest.assertEQ(['x', 'y', 'z', 'x'], log);
}());


(function TestObjectLiteralPatternLexicalInitializers() {
  'use strict';
  let { x : x, y : y = 2 } = { x : 1 };
  arktest.assertEQ(1, x);
  arktest.assertEQ(2, y);

  let {z = 3} = {};
  arktest.assertEQ(3, z);

  let log = [];
  let o = {
    get x() {
      log.push('x');
      return undefined;
    },
    get y() {
      log.push('y');
      return {
        get z() { log.push('z'); return undefined; }
      }
    }
  };

  let { x : x0 = 0, y : { z : z1 = 1 }, x : x1 = 5} = o;
  arktest.assertEQ(0, x0);
  arktest.assertEQ(1, z1);
  arktest.assertEQ(5, x1);
  arktest.assertEQ(['x', 'y', 'z', 'x'], log);

  let sum = 0;
  for (let {x = 0, z = 3} = {}; z != 0; z--) {
    arktest.assertEQ(0, x);
    sum += z;
  }
  arktest.assertEQ(6, sum);
}());


(function TestObjectLiteralPatternLexical() {
  'use strict';
  let { x : x, y : y } = { x : 1, y : 2 };
  arktest.assertEQ(1, x);
  arktest.assertEQ(2, y);

  let {z} = { z : 3 };
  arktest.assertEQ(3, z);

  let log = [];
  let o = {
    get x() {
      log.push('x');
      return 0;
    },
    get y() {
      log.push('y');
      return {
        get z() { log.push('z'); return 1; }
      }
    }
  };
  let { x : x0, y : { z : z1 }, x : x1 } = o;
  arktest.assertEQ(0, x0);
  arktest.assertEQ(1, z1);
  arktest.assertEQ(0, x1);
  arktest.assertEQ(['x', 'y', 'z', 'x'], log);

  let sum = 0;
  for (let {x, z} = { x : 0, z : 3 }; z != 0; z--) {
    arktest.assertEQ(0, x);
    sum += z;
  }
  arktest.assertEQ(6, sum);
}());


(function TestObjectLiteralPatternLexicalConst() {
  'use strict';
  const { x : x, y : y } = { x : 1, y : 2 };
  arktest.assertEQ(1, x);
  arktest.assertEQ(2, y);

  arktest.expectThrow(function() { x++; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(function() { y++; }, ((e: Error): boolean => e instanceof TypeError));

  const {z} = { z : 3 };
  arktest.assertEQ(3, z);

  for (const {x, z} = { x : 0, z : 3 }; z != 3 || x != 0;) {
    arktest.assertTrue(false);
  }
}());


(function TestFailingMatchesSloppy() {
  let {x, y} = {};
  arktest.assertEQ(undefined, x);
  arktest.assertEQ(undefined, y);

  let { x : { z1 }, y2} = { x : {}, y2 : 42 }
  arktest.assertEQ(undefined, z1);
  arktest.assertEQ(42, y2);
}());


(function TestFailingMatchesStrict() {
  'use strict';
  let {x, y} = {};
  arktest.assertEQ(undefined, x);
  arktest.assertEQ(undefined, y);

  let { x : { z1 }, y2} = { x : {}, y2 : 42 }
  arktest.assertEQ(undefined, z1);
  arktest.assertEQ(42, y2);

  {
    let {x1,y1} = {};
    arktest.assertEQ(undefined, x1);
    arktest.assertEQ(undefined, y1);

    let { x : { z1 }, y2} = { x : {}, y2 : 42 }
    arktest.assertEQ(undefined, z1);
    arktest.assertEQ(42, y2);
  }
}());


(function TestTDZInInitializers() {
  'use strict';
  {
    let {x, y = x} = {x : 42, y : 27};
    arktest.assertEQ(42, x);
    arktest.assertEQ(27, y);
  }

  {
    let {x, y = x + 1} = { x : 42 };
    arktest.assertEQ(42, x);
    arktest.assertEQ(43, y);
  }
  arktest.expectThrow(function() {
    let {x = y, y} = { y : 42 };
  }, ((e: Error): boolean => e instanceof ReferenceError));

  {
    let {x, y = eval('x+1')} = {x:42};
    arktest.assertEQ(42, x);
    arktest.assertEQ(43, y);
  }

  {
    let {x, y = () => eval('x+1')} = {x:42};
    arktest.assertEQ(42, x);
    arktest.assertEQ(43, y());
  }

  {
    let {x = function() {return y+1;}, y} = {y:42};
    arktest.assertEQ(43, x());
    arktest.assertEQ(42, y);
  }
  {
    let {x = function() {return eval('y+1');}, y} = {y:42};
    arktest.assertEQ(43, x());
    arktest.assertEQ(42, y);
  }
}());


(function TestSideEffectsInInitializers() {
  let callCount = 0;
  function f(v) { callCount++; return v; }

  callCount = 0;
  let { x = f(42) } = { x : 27 };
  arktest.assertEQ(27, x);
  arktest.assertEQ(0, callCount);

  callCount = 0;
  let { x = f(42) } = {};
  arktest.assertEQ(42, x);
  arktest.assertEQ(1, callCount);
}());


(function TestAssignmentExprInInitializers() {
  {
    let x;
    let y;
    {
      let { x = y = 1 } = {};
      arktest.assertEQ(x, 1);
      arktest.assertEQ(y, 1);
    }
    arktest.assertEQ(undefined, x);
    arktest.assertEQ(1, y);
  }

  {
    let x;
    let y;
    {
      let { x: x = y = 1 } = {};
      arktest.assertEQ(1, x);
      arktest.assertEQ(1, y);
    }
    arktest.assertEQ(undefined, x);
    arktest.assertEQ(1, y);
  }

  {
    let x;
    let y;
    {
      let [ x = y = 1 ] = [];
      arktest.assertEQ(1, x);
      arktest.assertEQ(1, y);
    }
    arktest.assertEQ(undefined, x);
    arktest.assertEQ(1, y);
  }

  {
    let x;
    let y;
    (function({ x = y = 1 }) {}({}));
    arktest.assertEQ(undefined, x);
    arktest.assertEQ(1, y);
  }

  {
    let x;
    let y;
    (function({ x: x = y = 1 }) {}({}));
    arktest.assertEQ(undefined, x);
    arktest.assertEQ(1, y);
  }

  {
    let x;
    let y;
    (function([ x = y = 1 ]) {}([]));
    arktest.assertEQ(undefined, x);
    arktest.assertEQ(1, y);
  }
}());


(function TestMultipleAccesses() {
  arktest.expectThrow(
    '\'use strict\';'+
    'const {x,x} = {x:1};',
    SyntaxError);

  arktest.expectThrow(
    '\'use strict\';'+
    'let {x,x} = {x:1};',
     SyntaxError);

  (function() {
    let {x,x = 2} = {x : 1};
    arktest.assertEQ(1, x);
  }());

  arktest.expectThrow(function () {
    'use strict';
    let {x = (function() { x = 2; }())} = {};
  }, ((e: Error): boolean => e instanceof ReferenceError));

  (function() {
    'use strict';
    let {x = (function() { x = 2; }())} = {x:1};
    arktest.assertEQ(1, x);
  }());
}());


(function TestComputedNames() {
  let x = 1;
  let {[x]:y} = {1:2};
  arktest.assertEQ(2, y);

  (function(){
    'use strict';
    let {[x]:y} = {1:2};
    arktest.assertEQ(2, y);
  }());

  let callCount = 0;
  function foo(v) { callCount++; return v; }

  (function() {
    callCount = 0;
    let {[foo('abc')]:x} = {abc:42};
    arktest.assertEQ(42, x);
    arktest.assertEQ(1, callCount);
  }());

  (function() {
    'use strict';
    callCount = 0;
    let {[foo('abc')]:x} = {abc:42};
    arktest.assertEQ(42, x);
    arktest.assertEQ(1, callCount);
  }());

  (function() {
    callCount = 0;
    let {[foo('abc')]:x} = {};
    arktest.assertEQ(undefined, x);
    arktest.assertEQ(1, callCount);
  }());

  (function() {
    'use strict';
    callCount = 0;
    let {[foo('abc')]:x} = {};
    arktest.assertEQ(undefined, x);
    arktest.assertEQ(1, callCount);
  }());

  for (let val of [null, undefined]) {
    callCount = 0;
    arktest.expectThrow(function() {
      let {[foo()]:x} = val;
    }, ((e: Error): boolean => e instanceof TypeError));
    arktest.assertEQ(0, callCount);

    callCount = 0;
    arktest.expectThrow(function() {
      'use strict';
      let {[foo()]:x} = val;
    }, ((e: Error): boolean => e instanceof TypeError));
    arktest.assertEQ(0, callCount);
  }

  let log = [];
  let o = {
    get x() { log.push('get x'); return 1; },
    get y() { log.push('get y'); return 2; }
  }
  function f(v) { log.push('f ' + v); return v; }

  (function() {
    log = [];
    let { [f('x')]:x, [f('y')]:y } = o;
    arktest.assertEQ(1, x);
    arktest.assertEQ(2, y);
    arktest.assertEQ(['f x', 'get x', 'f y', 'get y'], log);
  }());

  (function() {
    'use strict';
    log = [];
    let { [f('x')]:x, [f('y')]:y } = o;
    arktest.assertEQ(1, x);
    arktest.assertEQ(2, y);
    arktest.assertEQ(['f x', 'get x', 'f y', 'get y'], log);
  }());

  (function() {
    'use strict';
    log = [];
    const { [f('x')]:x, [f('y')]:y } = o;
    arktest.assertEQ(1, x);
    arktest.assertEQ(2, y);
    arktest.assertEQ(['f x', 'get x', 'f y', 'get y'], log);
  }());
}());


(function TestExceptions() {
  for (let val of [null, undefined]) {
    arktest.expectThrow(function() { let {} = val; }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(function() { let {x} = val; }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(function() { let { x : {} } = { x : val }; }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(function() { 'use strict'; let {} = val; }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(function() { 'use strict'; let {x} = val; }, ((e: Error): boolean => e instanceof TypeError));
    arktest.expectThrow(function() { 'use strict'; let { x : {} } = { x : val }; },
                 TypeError);
  }
}());


(function TestArrayLiteral() {
  let [a, b, c] = [1, 2, 3];
  arktest.assertEQ(1, a);
  arktest.assertEQ(2, b);
  arktest.assertEQ(3, c);
}());

(function TestIterators() {
  let log = [];
  function* f() {
    log.push('1');
    yield 1;
    log.push('2');
    yield 2;
    log.push('3');
    yield 3;
    log.push('done');
  };

  (function() {
    log = [];
    let [a, b, c] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(3, c);
    arktest.assertEQ(['1', '2', '3'], log);
  }());

  (function() {
    log = [];
    let [a, b, c, d] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(3, c);
    arktest.assertEQ(undefined, d);
    arktest.assertEQ(['1', '2', '3', 'done'], log);
  }());

  (function() {
    log = [];
    let [a, , c] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(3, c);
    arktest.assertEQ(['1', '2', '3'], log);
  }());

  (function() {
    log = [];
    let [a, , c, d] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(3, c);
    arktest.assertEQ(undefined, d);
    arktest.assertEQ(['1', '2', '3', 'done'], log);
  }());

  (function() {
    log = [];
    // last comma is not an elision.
    let [a, b,] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(['1', '2'], log);
  }());

  (function() {
    log = [];
    // last comma is not an elision, but the comma before the last is.
    let [a, b, ,] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(['1', '2', '3'], log);
  }());

  (function() {
    log = [];
    let [a, ...rest] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ([2,3], rest);
    arktest.assertEQ(['1', '2', '3', 'done'], log);
  }());

  (function() {
    log = [];
    let [a, b, c, ...rest] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(3, c);
    arktest.assertEQ([], rest);
    arktest.assertEQ(['1', '2', '3', 'done'], log);
  }());

  (function() {
    log = [];
    let [a, b, c, d, ...rest] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(3, c);
    arktest.assertEQ(undefined, d);
    arktest.assertEQ([], rest);
    arktest.assertEQ(['1', '2', '3', 'done'], log);
  }());
}());


(function TestIteratorsLexical() {
  'use strict';
  let log = [];
  function* f() {
    log.push('1');
    yield 1;
    log.push('2');
    yield 2;
    log.push('3');
    yield 3;
    log.push('done');
  };

  (function() {
    log = [];
    let [a, b, c] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(3, c);
    arktest.assertEQ(['1', '2', '3'], log);
  }());

  (function() {
    log = [];
    let [a, b, c, d] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(3, c);
    arktest.assertEQ(undefined, d);
    arktest.assertEQ(['1', '2', '3', 'done'], log);
  }());

  (function() {
    log = [];
    let [a, , c] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(3, c);
    arktest.assertEQ(['1', '2', '3'], log);
  }());

  (function() {
    log = [];
    let [a, , c, d] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(3, c);
    arktest.assertEQ(undefined, d);
    arktest.assertEQ(['1', '2', '3', 'done'], log);
  }());

  (function() {
    log = [];
    // last comma is not an elision.
    let [a, b,] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(['1', '2'], log);
  }());

  (function() {
    log = [];
    // last comma is not an elision, but the comma before the last is.
    let [a, b, ,] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(['1', '2', '3'], log);
  }());

  (function() {
    log = [];
    let [a, ...rest] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ([2,3], rest);
    arktest.assertEQ(['1', '2', '3', 'done'], log);
  }());

  (function() {
    log = [];
    let [a, b, c, ...rest] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(3, c);
    arktest.assertEQ([], rest);
    arktest.assertEQ(['1', '2', '3', 'done'], log);
  }());

  (function() {
    log = [];
    let [a, b, c, d, ...rest] = f();
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(3, c);
    arktest.assertEQ(undefined, d);
    arktest.assertEQ([], rest);
    arktest.assertEQ(['1', '2', '3', 'done'], log);
  }());
}());

(function TestIteratorsRecursive() {
  let log = [];
  function* f() {
    log.push('1');
    yield {x : 1, y : 2};
    log.push('2');
    yield [42, 27, 30];
    log.push('3');
    yield 'abc';
    log.push('done');
  };

  (function() {
    let [{x, y}, [a, b]] = f();
    arktest.assertEQ(1, x);
    arktest.assertEQ(2, y);
    arktest.assertEQ(42, a);
    arktest.assertEQ(27, b);
    arktest.assertEQ(['1', '2'], log);
  }());

  (function() {
    'use strict';
    log = [];
    let [{x, y}, [a, b]] = f();
    arktest.assertEQ(1, x);
    arktest.assertEQ(2, y);
    arktest.assertEQ(42, a);
    arktest.assertEQ(27, b);
    arktest.assertEQ(['1', '2'], log);
  }());
}());


(function TestForEachLexical() {
  'use strict';
  let a = [{x:1, y:-1}, {x:2,y:-2}, {x:3,y:-3}];
  let sumX = 0;
  let sumY = 0;
  let fs = [];
  for (let item of a) {
    let x = item.x;
    let y = item.y;
    sumX += x;
    sumY += y;
    fs.push({fx : function() { return x; }, fy : function() { return y }});
  }
  arktest.assertEQ(6, sumX);
  arktest.assertEQ(-6, sumY);
  arktest.assertEQ(3, fs.length);
  for (let i = 0; i < fs.length; i++) {
    let {fx,fy} = fs[i];
    arktest.assertEQ(i+1, fx());
    arktest.assertEQ(-(i+1), fy());
  }

  let o = { __proto__:null, 'a1':1, 'b2':2 };
  let sx = '';
  let sy = '';
  for (let [x,y] in o) {
    sx += x;
    sy += y;
  }
  arktest.assertEQ('ab', sx);
  arktest.assertEQ('12', sy);
}());


(function TestForEachVars() {
  let a = [{x:1, y:-1}, {x:2,y:-2}, {x:3,y:-3}];
  let sumX = 0;
  let sumY = 0;
  let fs = [];
  for (let item of a) {
    let x = item.x;
    let y = item.y;
    sumX += x;
    sumY += y;
    fs.push({fx : function() { return x; }, fy : function() { return y }});
  }
  arktest.assertEQ(6, sumX);
  arktest.assertEQ(-6, sumY);
  arktest.assertEQ(3, fs.length);
  for (let i = 0; i < fs.length; i++) {
    let {fx,fy} = fs[i];
    arktest.assertEQ(3, fx());
    arktest.assertEQ(-3, fy());
  }

  let o = { __proto__:null, 'a1':1, 'b2':2 };
  let sx = '';
  let sy = '';
  for (let [x,y] in o) {
    sx += x;
    sy += y;
  }
  arktest.assertEQ('ab', sx);
  arktest.assertEQ('12', sy);
}());


(function TestParameters() {
  function f({a, b}) { return a - b; }
  arktest.assertEQ(1, f({a : 6, b : 5}));

  function f1(c, {a, b}) { return c + a - b; }
  arktest.assertEQ(8, f1(7, {a : 6, b : 5}));

  function f2({c, d}, {a, b}) { return c - d + a - b; }
  arktest.assertEQ(7, f2({c : 7, d : 1}, {a : 6, b : 5}));

  function f3([{a, b}]) { return a - b; }
  arktest.assertEQ(1, f3([{a : 6, b : 5}]));

  let g = ({a, b}) => { return a - b; };
  arktest.assertEQ(1, g({a : 6, b : 5}));

  let g1 = (c, {a, b}) => { return c + a - b; };
  arktest.assertEQ(8, g1(7, {a : 6, b : 5}));

  let g2 = ({c, d}, {a, b}) => { return c - d + a - b; };
  arktest.assertEQ(7, g2({c : 7, d : 1}, {a : 6, b : 5}));

  let g3 = ([{a, b}]) => { return a - b; };
  arktest.assertEQ(1, g3([{a : 6, b : 5}]));
}());


(function TestExpressionsInParameters() {
  function f0(x = eval(0)) { return x }
  arktest.assertEQ(0, f0());
  function f1({a = eval(1)}) { return a }
  arktest.assertEQ(1, f1({}));
  function f2([x = eval(2)]) { return x }
  arktest.assertEQ(2, f2([]));
  function f3({[eval(7)]: x}) { return x }
  arktest.assertEQ(3, f3({7: 3}));
})();


(function TestParameterScoping() {
  let x = 1;

  function f1({a = x}) { let x = 2; return a; }
  arktest.assertEQ(1, f1({}));
  function f2({a = x}) { function x() {}; return a; }
  arktest.assertEQ(1, f2({}));
  (function() {
    'use strict';
    function f3({a = x}) { let x = 2; return a; }
    arktest.assertEQ(1, f3({}));
    function f4({a = x}) { const x = 2; return a; }
    arktest.assertEQ(1, f4({}));
    function f5({a = x}) { function x() {}; return a; }
    arktest.assertEQ(1, f5({}));
  })();
  function f6({a = eval('x')}) { let x; return a; }
  arktest.assertEQ(1, f6({}));
  (function() {
    'use strict';
    function f61({a = eval('x')}) { let x; return a; }
    arktest.assertEQ(1, f61({}));
  })();
  function f62({a = eval('\'use strict\'; x')}) { let x; return a; }
  arktest.assertEQ(1, f62({}));
  function f7({a = function() { return x }}) { let x; return a(); }
  arktest.assertEQ(1, f7({}));
  function f8({a = () => x}) { let x; return a(); }
  arktest.assertEQ(1, f8({}));
  function f9({a = () => eval('x')}) { let x; return a(); }
  arktest.assertEQ(1, f9({}));
  (function TestInitializedWithEvalArrowStrict() {
    'use strict';
    function f91({a = () => eval('x')}) { let x; return a(); }
    arktest.assertEQ(1, f91({}));
  })();
  function f92({a = () => { 'use strict'; return eval('x') }}) { let x; return a(); }
  arktest.assertEQ(1, f92({}));
  function f93({a = () => eval('\'use strict\'; x')}) { let x; return a(); }
  arktest.assertEQ(1, f93({}));

  let g1 = ({a = x}) => { let x = 2; return a; };
  arktest.assertEQ(1, g1({}));
  let g2 = ({a = x}) => { function x() {}; return a; };
  arktest.assertEQ(1, g2({}));
  (function() {
    'use strict';
    let g3 = ({a = x}) => { let x = 2; return a; };
    arktest.assertEQ(1, g3({}));
    let g4 = ({a = x}) => { const x = 2; return a; };
    arktest.assertEQ(1, g4({}));
    let g5 = ({a = x}) => { function x() {}; return a; };
    arktest.assertEQ(1, g5({}));
  })();
  let g6 = ({a = eval('x')}) => { let x; return a; };
  arktest.assertEQ(1, g6({}));
  (function() {
    'use strict';
    const g61 = ({a = eval('x')}) => { let x; return a; };
    arktest.assertEQ(1, g61({}));
  })();
  const g62 = ({a = eval('\'use strict\'; x')}) => { let x; return a; };
  arktest.assertEQ(1, g62({}));
  let g7 = ({a = function() { return x }}) => { let x; return a(); };
  arktest.assertEQ(1, g7({}));
  let g8 = ({a = () => x}) => { let x; return a(); };
  arktest.assertEQ(1, g8({}));
  let g9 = ({a = () => eval('x')}) => { let x; return a(); };
  arktest.assertEQ(1, g9({}));
  (function() {
    'use strict';
    const g91 = ({a = () => eval('x')}) => { let x; return a(); };
    arktest.assertEQ(1, g91({}));
    const g92 = ({a = () => { return eval('x') }}) => { let x; return a(); };
    arktest.assertEQ(1, g92({}));
  })();
  const g93 = ({a = () => eval('\'use strict\'; x')}) => { let x; return a(); };
  arktest.assertEQ(1, g93({}));

  const f11 = function f({x = f}) { let f; return x; }
  arktest.assertEQ(f11, f11({}));
  const f12 = function f({x = f}) { function f() {}; return x; }
  arktest.assertEQ(f12, f12({}));
  (function() {
    'use strict';
    const f13 = function f({x = f}) { let f; return x; }
    arktest.assertEQ(f13, f13({}));
    const f14 = function f({x = f}) { const f = 0; return x; }
    arktest.assertEQ(f14, f14({}));
    const f15 = function f({x = f}) { function f() {}; return x; }
    arktest.assertEQ(f15, f15({}));
  })();
  const f16 = function f({f = 7, x = f}) { return x; }
  arktest.assertEQ(7, f16({}));

  let y = 'a';
  function f20({[y]: x}) { let y = 'b'; return x; }
  arktest.assertEQ(1, f20({a: 1, b: 2}));
  function f21({[eval('y')]: x}) { let y = 'b'; return x; }
  arktest.assertEQ(1, f21({a: 1, b: 2}));
  let g20 = ({[y]: x}) => { let y = 'b'; return x; };
  arktest.assertEQ(1, g20({a: 1, b: 2}));
  let g21 = ({[eval('y')]: x}) => { let y = 'b'; return x; };
  arktest.assertEQ(1, g21({a: 1, b: 2}));
})();


(function TestParameterDestructuringTDZ() {
  function f1({a = x}, x) { return a }
  arktest.expectThrow(() => f1({}, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f1({a: 4}, 5));
  function f2({a = eval('x')}, x) { return a }
  arktest.expectThrow(() => f2({}, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f2({a: 4}, 5));
  (function() {
    'use strict';
    function f3({a = eval('x')}, x) { return a }
    arktest.expectThrow(() => f3({}, 4), ((e: Error): boolean => e instanceof ReferenceError));
    arktest.assertEQ(4, f3({a: 4}, 5));
  })();
  function f4({a = eval('\'use strict\'; x')}, x) { return a }
  arktest.expectThrow(() => f4({}, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f4({a: 4}, 5));

  function f5({a = () => x}, x) { return a() }
  arktest.assertEQ(4, f5({a: () => 4}, 5));
  function f6({a = () => eval('x')}, x) { return a() }
  arktest.assertEQ(4, f6({a: () => 4}, 5));
  (function() {
    'use strict';
    function f7({a = () => eval('x')}, x) { return a() }
    arktest.assertEQ(4, f7({a: () => 4}, 5));
  })();
  function f8({a = () => eval('\'use strict\'; x')}, x) { return a() }
  arktest.assertEQ(4, f8({a: () => 4}, 5));

  function f11({a = b}, {b}) { return a }
  arktest.expectThrow(() => f11({}, {b: 4}), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f11({a: 4}, {b: 5}));
  function f12({a = eval('b')}, {b}) { return a }
  arktest.expectThrow(() => f12({}, {b: 4}), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f12({a: 4}, {b: 5}));
  (function() {
    'use strict';
    function f13({a = eval('b')}, {b}) { return a }
    arktest.expectThrow(() => f13({}, {b: 4}), ((e: Error): boolean => e instanceof ReferenceError));
    arktest.assertEQ(4, f13({a: 4}, {b: 5}));
  })();
  function f14({a = eval('\'use strict\'; b')}, {b}) { return a }
  arktest.expectThrow(() => f14({}, {b: 4}), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f14({a: 4}, {b: 5}));

  function f15({a = () => b}, {b}) { return a() }
  arktest.assertEQ(4, f15({a: () => 4}, {b: 5}));
  function f16({a = () => eval('b')}, {b}) { return a() }
  arktest.assertEQ(4, f16({a: () => 4}, {b: 5}));
  (function() {
    'use strict';
    function f17({a = () => eval('b')}, {b}) { return a() }
    arktest.assertEQ(4, f17({a: () => 4}, {b: 5}));
  })();
  function f18({a = () => eval('\'use strict\'; b')}, {b}) { return a() }
  arktest.assertEQ(4, f18({a: () => 4}, {b: 5}));

  // TODO(caitp): TDZ for rest parameters is not working yet.

  function f34({x = function() { return a }}, ...a) { return x()[0] }
  arktest.assertEQ(4, f34({}, 4));
  function f35({x = () => a}, ...a) { return x()[0] }
  arktest.assertEQ(4, f35({}, 4));
  function f36({x = () => eval('a')}, ...a) { return x()[0] }
  arktest.assertEQ(4, f36({}, 4));
  (function() {
    'use strict';
    function f37({x = () => eval('a')}, ...a) { return x()[0] }
    arktest.assertEQ(4, f37({}, 4));
  })();
  function f38({x = () => { 'use strict'; return eval('a') }}, ...a) { return x()[0] }
  arktest.assertEQ(4, f38({}, 4));
  function f39({x = () => eval('\'use strict\'; a')}, ...a) { return x()[0] }
  arktest.assertEQ(4, f39({}, 4));

  const g34 = ({x = function() { return a }}, ...a) => { return x()[0] };
  arktest.assertEQ(4, g34({}, 4));
  const g35 = ({x = () => a}, ...a) => { return x()[0] };
  arktest.assertEQ(4, g35({}, 4));
})();


(function TestDuplicatesInParameters() {
  arktest.expectThrow('\'use strict\';function f(x,x){}', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\';function f({x,x}){}', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\';function f(x, {x}){}', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\';var f = (x,x) => {};', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\';var f = ({x,x}) => {};', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\';var f = (x, {x}) => {};', ((e: Error): boolean => e instanceof SyntaxError));

  function ok1(x) { let x; return x; };
  arktest.assertEQ(1, ok1(1));
  function ok2(x) { 'use strict'; { let x = 2; return x; } };
  arktest.assertEQ(2, ok2(1));
}());


(function TestShadowingOfParameters() {
  function f1({x}) { let x = 2; return x }
  arktest.assertEQ(2, f1({x: 1}));
  function f2({x}) { { let x = 2; } return x; }
  arktest.assertEQ(2, f2({x: 1}));
  function f3({x}) { let y = x; let x = 2; return y; }
  arktest.assertEQ(1, f3({x: 1}));
  function f4({x}) { { let y = x; let x = 2; } return y; }
  arktest.assertEQ(1, f4({x: 1}));
  function f5({x}, g = () => x) { let x = 2; return g(); }
  arktest.assertEQ(1, f5({x: 1}));
  function f6({x}, g = () => x) { { let x = 2; } return g(); }
  arktest.assertEQ(1, f6({x: 1}));
  function f7({x}) { let g = () => x; let x = 2; return g(); }
  arktest.assertEQ(2, f7({x: 1}));
  function f8({x}) { { let g = () => x; let x = 2; } return g(); }
  arktest.assertEQ(2, f8({x: 1}));
  function f9({x}, g = () => eval('x')) { let x = 2; return g(); }
  arktest.assertEQ(1, f9({x: 1}));

  function f10({x}, y) { let y; return y }
  arktest.assertEQ(2, f10({x: 6}, 2));
  function f11({x}, y) { let z = y; let y = 2; return z; }
  arktest.assertEQ(1, f11({x: 6}, 1));
  function f12(y, g = () => y) { let y = 2; return g(); }
  arktest.assertEQ(1, f12(1));
  function f13({x}, y, [z], v) {
    let x;
    let y;
    let z;
    return x*y*z*v;
  }
  arktest.assertEQ(210, f13({x: 2}, 3, [5], 7));

  function f20({x}) { function x() { return 2 }; return x(); }
  arktest.assertEQ(2, f20({x: 1}));
  // Annex B 3.3 function hoisting is blocked by the conflicting x declaration
  function f21({x}) { { function x() { return 2 } } return x; }
  arktest.assertEQ(1, f21({x: 1}));

  let g1 = ({x}) => { let x = 2; return x };
  arktest.assertEQ(2, g1({x: 1}));
  let g2 = ({x}) => { { let x = 2; } return x; };
  arktest.assertEQ(2, g2({x: 1}));
  let g3 = ({x}) => { let y = x; let x = 2; return y; };
  arktest.assertEQ(1, g3({x: 1}));
  let g4 = ({x}) => { { let y = x; let x = 2; } return y; };
  arktest.assertEQ(1, g4({x: 1}));
  let g5 = ({x}, g = () => x) => { let x = 2; return g(); };
  arktest.assertEQ(1, g5({x: 1}));
  let g6 = ({x}, g = () => x) => { { let x = 2; } return g(); };
  arktest.assertEQ(1, g6({x: 1}));
  let g7 = ({x}) => { let g = () => x; let x = 2; return g(); };
  arktest.assertEQ(2, g7({x: 1}));
  let g8 = ({x}) => { { let g = () => x; let x = 2; } return g(); };
  arktest.assertEQ(2, g8({x: 1}));
  let g9 = ({x}, g = () => eval('x')) => { let x = 2; return g(); };
  arktest.assertEQ(1, g9({x: 1}));

  const g10 = ({x}, y) => { let y; return y };
  arktest.assertEQ(2, g10({x: 6}, 2));
  const g11 = ({x}, y) => { let z = y; let y = 2; return z; };
  arktest.assertEQ(1, g11({x: 6}, 1));
  const g12 = (y, g = () => y) => { let y = 2; return g(); };
  arktest.assertEQ(1, g12(1));
  const g13 = ({x}, y, [z], v) => {
    let x;
    let y;
    let z;
    return x*y*z*v;
  };
  arktest.assertEQ(210, g13({x: 2}, 3, [5], 7));

  let g20 = ({x}) => { function x() { return 2 }; return x(); }
  arktest.assertEQ(2, g20({x: 1}));
  let g21 = ({x}) => { { function x() { return 2 } } return x(); }
  arktest.expectThrow(() => g21({x: 1}), ((e: Error): boolean => e instanceof TypeError));

  // These errors are not recognized in lazy parsing; see mjsunit/bugs/bug-2728.js
  arktest.expectThrow('\'use strict\'; (function f(x) { let x = 0; })()', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\'; (function f({x}) { let x = 0; })()', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\'; (function f(x) { const x = 0; })()', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\'; (function f({x}) { const x = 0; })()', ((e: Error): boolean => e instanceof SyntaxError));

  arktest.expectThrow('\'use strict\'; let g = (x) => { let x = 0; }', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\'; let g = ({x}) => { let x = 0; }', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\'; let g = (x) => { const x = 0; }', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\'; let g = ({x}) => { const x = 0; }', ((e: Error): boolean => e instanceof SyntaxError));
}());


(function TestArgumentsForNonSimpleParameters() {
  function f1({}, x) { arguments[1] = 0; return x }
  arktest.assertEQ(6, f1({}, 6));
  function f2({}, x) { x = 2; return arguments[1] }
  arktest.assertEQ(7, f2({}, 7));
  function f3(x, {}) { arguments[0] = 0; return x }
  arktest.assertEQ(6, f3(6, {}));
  function f4(x, {}) { x = 2; return arguments[0] }
  arktest.assertEQ(7, f4(7, {}));
  function f5(x, ...a) { arguments[0] = 0; return x }
  arktest.assertEQ(6, f5(6, {}));
  function f6(x, ...a) { x = 2; return arguments[0] }
  arktest.assertEQ(6, f6(6, {}));
  function f7({a: x}) { x = 2; return arguments[0].a }
  arktest.assertEQ(5, f7({a: 5}));
  function f8(x, ...a) { a = []; return arguments[1] }
  arktest.assertEQ(6, f8(5, 6));
}());


(function TestForInOfTDZ() {
  arktest.expectThrow('\'use strict\'; let x = {}; for (let [x, y] of [x]);', ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow('\'use strict\'; let x = {}; for (let [y, x] of [x]);', ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow('\'use strict\'; let x = {}; for (let [x, y] in {x});', ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow('\'use strict\'; let x = {}; for (let [y, x] in {x});', ((e: Error): boolean => e instanceof ReferenceError));
}());


(function TestFunctionLength() {
   arktest.assertEQ(1, (function({}) {}).length);
   arktest.assertEQ(1, (function([]) {}).length);
   arktest.assertEQ(1, (function({x}) {}).length);
   arktest.assertEQ(1, (function({}, ...a) {}).length);
   arktest.assertEQ(1, (function({x}, {y} = {}) {}).length);
   arktest.assertEQ(1, (function({x}, {y} = {}, ...a) {}).length);
   arktest.assertEQ(2, (function(x, {y}, {z} = {}) {}).length);
   arktest.assertEQ(2, (function({x}, {}, {z} = {}, ...a) {}).length);
   arktest.assertEQ(1, (function(x, {y} = {}, {z}) {}).length);
   arktest.assertEQ(1, (function({x}, {y} = {}, {z}, ...a) {}).length);
   arktest.assertEQ(1, (function(x, {y} = {}, {z}, {v} = {}) {}).length);
   arktest.assertEQ(1, (function({x}, {y} = {}, {z}, {v} = {}, ...a) {}).length);
})();


(function TestDirectiveThrows() {
  'use strict';

  arktest.expectThrow(function(){ eval('function({}){\'use strict\';}') }, ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(function(){ eval('({}) => {\'use strict\';}') }, ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(
    function(){ eval('(class{foo({}) {\'use strict\';}});') }, SyntaxError);

  arktest.expectThrow(
    function(){ eval('function(a, {}){\'use strict\';}') }, SyntaxError);
  arktest.expectThrow(function(){ eval('(a, {}) => {\'use strict\';}') }, ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(
    function(){ eval('(class{foo(a, {}) {\'use strict\';}});') }, SyntaxError);
})();


(function TestLegacyConstDestructuringInForLoop() {
  let result;
  for (const entry of [{foo: 1}]) { result = entry.foo; }
  arktest.assertEQ(1, result);
})();


(function TestCatch() {
  'use strict';

  // For testing proper scoping.
  let foo = 'hello';
  const bar = 'world';
  let baz = 42;

  try {
    throw {foo: 1, bar: 2};
  } catch ({foo, bar, baz = 3}) {
    arktest.assertEQ(1, foo);
    arktest.assertEQ(2, bar);
    arktest.assertEQ(3, baz);
  }

  try {
    throw [1, 2, 3];
  } catch ([foo, ...bar]) {
    arktest.assertEQ(1, foo);
    arktest.assertEQ([2, 3], bar);
  }

  arktest.assertEQ('hello', foo);
  arktest.assertEQ('world', bar);
  arktest.assertEQ(42, baz);

  arktest.assertEQ(undefined, eval('try {throw {foo: 1, bar: 2}} catch({foo}) {}'));
  arktest.assertEQ(undefined, eval('try {throw [1, 2, 3]} catch([x]) {}'));
})();

// Property access as declaration target.
arktest.expectThrow('let [o.x=1]=[]', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('let {x:o.f=1}={x:1}', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('(o.f=1)=>0', ((e: Error): boolean => e instanceof SyntaxError));

// Invalidly parenthesized declaration targets.
arktest.expectThrow('for (({x}) of [{x:1}]) {}', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('for (var ({x}) of [{x:1}]) {}', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('for await (({x}) of [{x:1}]) {}', ((e: Error): boolean => e instanceof SyntaxError));

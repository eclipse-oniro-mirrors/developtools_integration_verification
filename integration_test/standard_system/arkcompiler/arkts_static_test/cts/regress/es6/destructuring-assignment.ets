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
expected_out_1: "Syntax error ESY0224: Identifier expected, got '{'."
---*/

let {value} = {value: 1};


// script-level tests
let ox;
const oy = {};
let oz;
({
  x: ox,
  y: oy.value,
  y2: oy['value2'],
  z: ({ set v(val) { oz = val; } }).v
} = {
  x: 'value of x',
  y: 'value of y1',
  y2: 'value of y2',
  z: 'value of z'
});
arktest.assertEQ('value of x', ox);
arktest.assertEQ('value of y1', oy.value);
arktest.assertEQ('value of y2', oy.value2);
arktest.assertEQ('value of z', oz);

[ox, oy.value, oy['value2'], ...{ set v(val) { oz = val; } }.v] = [
  1007,
  798432,
  555,
  1, 2, 3, 4, 5
];
arktest.assertEQ(ox, 1007);
arktest.assertEQ(oy.value, 798432);
arktest.assertEQ(oy.value2, 555);
arktest.assertEQ(oz, [1, 2, 3, 4, 5]);


(function testInFunction() {
  let x;
  let y = {};
  let z;
  ({
    x: x,
    y: y.value,
    y2: y['value2'],
    z: ({ set v(val) { z = val; } }).v
  } = {
    x: 'value of x',
    y: 'value of y1',
    y2: 'value of y2',
    z: 'value of z'
  });
  arktest.assertEQ('value of x', x);
  arktest.assertEQ('value of y1', y.value);
  arktest.assertEQ('value of y2', y.value2);
  arktest.assertEQ('value of z', z);

  [x, y.value, y['value2'], ...{ set v(val) { z = val; } }.v] = [
    1007,
    798432,
    555,
    1, 2, 3, 4, 5
  ];
  arktest.assertEQ(x, 1007);
  arktest.assertEQ(y.value, 798432);
  arktest.assertEQ(y.value2, 555);
  arktest.assertEQ(z, [1, 2, 3, 4, 5]);
})();


(function testArrowFunctionInitializers() {
  let fn = (config = {
    value: defaults.value,
    nada: { nada: defaults.nada } = { nada: 'nothing' }
  } = { value: 'BLAH' }) => config;
  let defaults = {};
  arktest.assertEQ({ value: 'BLAH' }, fn());
  arktest.assertEQ('BLAH', defaults.value);
  arktest.assertEQ('nothing', defaults.nada);
})();


(function testArrowFunctionInitializers2() {
  let fn = (config = [
    defaults.value,
    { nada: defaults.nada } = { nada: 'nothing' }
  ] = ['BLAH']) => config;
  let defaults = {};
  arktest.assertEQ(['BLAH'], fn());
  arktest.assertEQ('BLAH', defaults.value);
  arktest.assertEQ('nothing', defaults.nada);
})();


(function testFunctionInitializers() {
  function fn(config = {
    value: defaults.value,
    nada: { nada: defaults.nada } = { nada: 'nothing' }
  } = { value: 'BLAH' }) {
    return config;
  }
  let defaults = {};
  arktest.assertEQ({ value: 'BLAH' }, fn());
  arktest.assertEQ('BLAH', defaults.value);
  arktest.assertEQ('nothing', defaults.nada);
})();


(function testFunctionInitializers2() {
  function fn(config = [
    defaults.value,
    { nada: defaults.nada } = { nada: 'nothing' }
  ] = ['BLAH']) { return config; }
  let defaults = {};
  arktest.assertEQ(['BLAH'], fn());
  arktest.assertEQ('BLAH', defaults.value);
  arktest.assertEQ('nothing', defaults.nada);
})();


(function testDeclarationInitializers() {
  let defaults = {};
  let { value } = { value: defaults.value } = { value: 'BLAH' };
  arktest.assertEQ('BLAH', value);
  arktest.assertEQ('BLAH', defaults.value);
})();


(function testDeclarationInitializers2() {
  let defaults = {};
  let [value] = [defaults.value] = ['BLAH'];
  arktest.assertEQ('BLAH', value);
  arktest.assertEQ('BLAH', defaults.value);
})();


(function testObjectLiteralProperty() {
  let ext = {};
  let obj = {
    a: { b: ext.b, c: ext['c'], d: { set v(val) { ext.d = val; } }.v } = {
      b: 'b', c: 'c', d: 'd' }
  };
  arktest.assertEQ({ b: 'b', c: 'c', d: 'd' }, ext);
  arktest.assertEQ({ a: { b: 'b', c: 'c', d: 'd' } }, obj);
})();


(function testArrayLiteralProperty() {
  let ext = {};
  let obj = [
    ...[ ext.b, ext['c'], { set v(val) { ext.d = val; } }.v ] = [
      'b', 'c', 'd' ]
  ];
  arktest.assertEQ({ b: 'b', c: 'c', d: 'd' }, ext);
  arktest.assertEQ([ 'b', 'c', 'd' ], obj);
})();


// TODO(caitp): add similar test for ArrayPatterns, once Proxies support
// delegating symbol-keyed get/set.
(function testObjectPatternOperationOrder() {
  let steps = [];
  const store = {};
  function computePropertyName(name) {
    steps.push('compute name: ' + name);
    return name;
  }
  function loadValue(descr, value) {
    steps.push('load: ' + descr + ' > ' + value);
    return value;
  }
  function storeValue(descr, name, value) {
    steps.push('store: ' + descr + ' = ' + value);
    store[name] = value;
  }
  let result = {
    get a() { arktest.assertTrue(false)(); },
    set a(value) { storeValue('result.a', 'a', value); },
    get b() { arktest.assertTrue(false)(); },
    set b(value) { storeValue('result.b', 'b', value); }
  };

  ({
    obj: {
      x: result.a = 10,
      [computePropertyName('y')]: result.b = false,
    } = {}
  } = { obj: {
    get x() { return loadValue('.temp.obj.x', undefined); },
    set x(value) { arktest.assertTrue(false)(); },
    get y() { return loadValue('.temp.obj.y', undefined); },
    set y(value) { arktest.assertTrue(false)(); }
  }});

  arktest.assertTrue({
    a: 10,
    b: false
  }, store);

  arktest.assertEQ([
    'load: .temp.obj.x > undefined',
    'store: result.a = 10',

    'compute name: y',
    'load: .temp.obj.y > undefined',
    'store: result.b = false'
  ], steps);

  steps = [];

  ({
    obj: {
      x: result.a = 50,
      [computePropertyName('y')]: result.b = 'hello',
    } = {}
  } = { obj: {
    get x() { return loadValue('.temp.obj.x', 20); },
    set x(value) { arktest.assertTrue(false)(); },
    get y() { return loadValue('.temp.obj.y', true); },
    set y(value) { arktest.assertTrue(false)(); }
  }});

  arktest.assertTrue({
    a: 20,
    b: true
  }, store);

  arktest.assertEQ([
    'load: .temp.obj.x > 20',
    'store: result.a = 20',
    'compute name: y',
    'load: .temp.obj.y > true',
    'store: result.b = true',
  ], steps);
})();

// Credit to Mike Pennisi and other Test262 contributors for originally writing
// the testse the following are based on.
(function testArrayElision() {
  let value = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  let a;
  let obj = {};
  let result = [, a, , obj.b, , ...obj['rest']] = value;

  arktest.assertEQ(result, value);
  arktest.assertEQ(2, a);
  arktest.assertEQ(4, obj.b);
  arktest.assertEQ([6, 7, 8, 9], obj.rest);
})();

(function testArrayElementInitializer() {
  function test(value, initializer, expected) {
    let a;
    let obj = {};
    let initialized = false;
    const shouldBeInitialized = value[0] === undefined;
    arktest.assertEQ(value, [ a = (initialized = true, initializer) ] = value);
    arktest.assertEQ(expected, a);
    arktest.assertEQ(shouldBeInitialized, initialized);

    let initialized2 = false;
    arktest.assertEQ(value, [ obj.a = (initialized2 = true, initializer) ] = value);
    arktest.assertEQ(expected, obj.a);
    arktest.assertEQ(shouldBeInitialized, initialized2);
  }

  test([], 'BAM!', 'BAM!');
  test([], 'BOOP!', 'BOOP!');
  test([null], 123, null);
  test([undefined], 456, 456);
  test([,], 'PUPPIES', 'PUPPIES');

  (function ordering() {
    let x = 0, 
    let a = [];
    let b = [];
    let value = [];

    arktest.assertEQ(value, [ a = x += 1, b = x *= 2 ] = value);
    arktest.assertEQ(1, a);
    arktest.assertEQ(2, b);
    arktest.assertEQ(2, x);
  })();

  (function yieldExpression() {
    let value = [];
    let it;
    let result;
    let x;
    it = (function*() {
      result = [ x = yield ] = value;
    })();
    let next = it.next();

    arktest.assertEQ(undefined, result);
    arktest.assertEQ(undefined, next.value);
    arktest.assertEQ(false, next.done);
    arktest.assertEQ(undefined, x);

    next = it.next(86);

    arktest.assertEQ(value, result);
    arktest.assertEQ(undefined, next.value);
    arktest.assertEQ(true, next.done);
    arktest.assertEQ(86, x);
  })();

  (function yieldIdentifier() {
    let value = [];
    let yield = 'BOOP!';
    let x;
    arktest.assertEQ(value, [ x = yield ] = value);
    arktest.assertEQ('BOOP!', x);
  })();

  arktest.expectThrow(function let_TDZ() {
    'use strict';
    let x;
    [ x = y ] = [];
    let y;
  }, ((e: Error): boolean => e instanceof ReferenceError));
})();


(function testArrayElementNestedPattern() {
  arktest.expectThrow(function nestedArrayRequireObjectCoercibleNull() {
    let x; [ [ x ] ] = [ null ];
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function nestedArrayRequireObjectCoercibleUndefined() {
    let x; [ [ x ] ] = [ undefined ];
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function nestedArrayRequireObjectCoercibleUndefined2() {
    let x; [ [ x ] ] = [ ];
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function nestedArrayRequireObjectCoercibleUndefined3() {
    let x; [ [ x ] ] = [ , ];
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function nestedObjectRequireObjectCoercibleNull() {
    let x; [ { x } ] = [ null ];
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function nestedObjectRequireObjectCoercibleUndefined() {
    let x; [ { x } ] = [ undefined ];
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function nestedObjectRequireObjectCoercibleUndefined2() {
    let x; [ { x } ] = [ ];
  }, ((e: Error): boolean => e instanceof TypeError));

  arktest.expectThrow(function nestedObjectRequireObjectCoercibleUndefined3() {
    let x; [ { x } ] = [ , ];
  }, ((e: Error): boolean => e instanceof TypeError));

  (function nestedArray() {
    let x;
    let value = [ [ 'zap', 'blonk' ] ];
    arktest.assertEQ(value, [ [ , x ] ] = value);
    arktest.assertEQ('blonk', x);
  })();

  (function nestedObject() {
    let x;
    let value = [ { a: 'zap', b: 'blonk' } ];
    arktest.assertEQ(value, [ { b: x } ] = value);
    arktest.assertEQ('blonk', x);
  })();
})();

(function testArrayRestElement() {
  (function testBasic() {
    let x = [1, 2, 3];
    const rest = [1, 2, 3];
    let array = [1, 2, 3];
    arktest.assertEQ(array, [x, ...rest] = array);
    arktest.assertEQ(1, x);
    arktest.assertEQ([2, 3], rest);

    array = [4, 5, 6];
    arktest.assertEQ(array, [, ...rest] = array);
    arktest.assertEQ([5, 6], rest);

  })();

  (function testNestedRestObject() {
    let value = [1, 2, 3];
    let x;
    arktest.assertEQ(value, [...{ 1: x }] = value);
    arktest.assertEQ(2, x);
  })();

  (function iterable() {
    let count = 0;
    let x;
    let y;
    let z;
    function* g() {
      count++;
      yield;
      count++;
      yield;
      count++;
      yield;
    }
    let it = g();
    arktest.assertEQ(it, [...x] = it);
    arktest.assertEQ([undefined, undefined, undefined], x);
    arktest.assertEQ(3, count);

    it = [g()];
    arktest.assertEQ(it, [ [...y] ] = it);
    arktest.assertEQ([undefined, undefined, undefined], y);
    arktest.assertEQ(6, count);

    it = { a: g() };
    arktest.assertEQ(it, { a: [...z] } = it);
    arktest.assertEQ([undefined, undefined, undefined], z);
    arktest.assertEQ(9, count);
  })();
})();

(function testRequireObjectCoercible() {
  arktest.expectThrow(() => ({} = undefined), ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => ({} = null), ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => [] = undefined, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => [] = null, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ('test', ({} = 'test'));
  arktest.assertEQ('test', [] = 'test');
  arktest.assertEQ(123, ({} = 123));
})();

(function testConstReassignment() {
  'use strict';
  const c = 'untouchable';
  arktest.expectThrow(() => { [ c ] = [ 'nope!' ]; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => { [ [ c ] ]  = [ [ 'nope!' ] ]; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => { [ { c } ]  = [ { c: 'nope!' } ]; }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => { ({ c } = { c: 'nope!' }); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => { ({ a: { c } } = { a: { c: 'nope!' } }); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.expectThrow(() => { ({ a: [ c ] } = { a: [ 'nope!' ] }); }, ((e: Error): boolean => e instanceof TypeError));
  arktest.assertEQ('untouchable', c);
})();

(function testForIn() {
  let log = [];
  let x = {};
  const object = {
    'Apenguin': 1,
    '\u{1F382}cake': 2,
    'Bpuppy': 3,
    'Cspork': 4
  };
  for ([x.firstLetter, ...x.rest] in object) {
    if (x.firstLetter === 'A') {
      arktest.assertEQ(['p', 'e', 'n', 'g', 'u', 'i', 'n'], x.rest);
      continue;
    }
    if (x.firstLetter === 'C') {
      arktest.assertEQ(['s', 'p', 'o', 'r', 'k'], x.rest);
      break;
    }
    log.push({ firstLetter: x.firstLetter, rest: x.rest });
  }
  arktest.assertEQ([
    { firstLetter: '\u{1F382}', rest: ['c', 'a', 'k', 'e'] },
    { firstLetter: 'B', rest: ['p', 'u', 'p', 'p', 'y'] },
  ], log);
})();

(function testForOf() {
  let log = [];
  let x = {};
  const names = [
    'Apenguin',
    '\u{1F382}cake',
    'Bpuppy',
    'Cspork'
  ];
  for ([x.firstLetter, ...x.rest] of names) {
    if (x.firstLetter === 'A') {
      arktest.assertEQ(['p', 'e', 'n', 'g', 'u', 'i', 'n'], x.rest);
      continue;
    }
    if (x.firstLetter === 'C') {
      arktest.assertEQ(['s', 'p', 'o', 'r', 'k'], x.rest);
      break;
    }
    log.push({ firstLetter: x.firstLetter, rest: x.rest });
  }
  arktest.assertEQ([
    { firstLetter: '\u{1F382}', rest: ['c', 'a', 'k', 'e'] },
    { firstLetter: 'B', rest: ['p', 'u', 'p', 'p', 'y'] },
  ], log);
})();

(function testNewTarget() {
  arktest.expectThrow('(function() { [...new.target] = []; })', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(function() { [a] = [...new.target] = []; })', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(function() { [new.target] = []; })', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(function() { [a] = [new.target] = []; })', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(function() { ({ a: new.target] = {a: 0}); })', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(function() { ({ a } = { a: new.target } = {}); })',
               SyntaxError);

  function ReturnNewTarget1() {
    let result;
    [result = new.target] = [];
    return result;
  }

  function ReturnNewTarget2() {
    let result;
    [result] = [new.target];
    return result;
  }

  function ReturnNewTarget3() {
    let result;
    ({ result = new.target } = {});
    return result;
  }

  function ReturnNewTarget4() {
    let result;
    ({ result } = { result: new.target });
    return result;
  }

  function fakeNewTarget() {}

  function construct() {
    arktest.assertEQ(undefined, ReturnNewTarget1());
    arktest.assertEQ(ReturnNewTarget1, new ReturnNewTarget1());
    arktest.assertEQ(fakeNewTarget,
                 Reflect.construct(ReturnNewTarget1, [], fakeNewTarget));

    arktest.assertEQ(undefined, ReturnNewTarget2());
    arktest.assertEQ(ReturnNewTarget2, new ReturnNewTarget2());
    arktest.assertEQ(fakeNewTarget,
                 Reflect.construct(ReturnNewTarget2, [], fakeNewTarget));

    arktest.assertEQ(undefined, ReturnNewTarget3());
    arktest.assertEQ(ReturnNewTarget3, new ReturnNewTarget3());
    arktest.assertEQ(fakeNewTarget,
                 Reflect.construct(ReturnNewTarget3, [], fakeNewTarget));

    arktest.assertEQ(undefined, ReturnNewTarget4());
    arktest.assertEQ(ReturnNewTarget4, new ReturnNewTarget4());
    arktest.assertEQ(fakeNewTarget,
                 Reflect.construct(ReturnNewTarget4, [], fakeNewTarget));
  }
  construct();
  fakeNewTarget.prototype = 1;
  construct();
})();

(function testSuperCall() {
  function ctor(body) {
    return () => eval('(class extends Object { \n' +
                      '  constructor() {\n' +
                      body +
                      '\n  }\n' +
                      '})');
  }
  arktest.expectThrow(ctor('({ new: super() } = {})'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(ctor('({ new: x } = { new: super() } = {})'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(ctor('[super()] = []'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(ctor('[x] = [super()] = []'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(ctor('[...super()] = []'), ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow(ctor('[x] = [...super()] = []'), ((e: Error): boolean => e instanceof SyntaxError));

  class Base { get foo() { return 1; } }
  function ext(body) {
    return eval('new (class extends Base {\n' +
                '  constructor() {\n' +
                body + ';\n' +
                '  return { x: super.foo }' +
                '\n  }\n' +
                '})');
  }
  arktest.assertEQ(1, ext('let x; [x = super()] = []').x);
  arktest.assertEQ(1, ext('let x, y; [y] = [x = super()] = []').x);
  arktest.assertEQ(1, ext('let x; [x] = [super()]').x);
  arktest.assertEQ(1, ext('let x, y; [y] = [x] = [super()]').x);

  arktest.assertEQ(1, ext('let x; ({x = super()} = {})').x);
  arktest.assertEQ(1, ext('let x, y; ({ x: y } = { x = super() } = {})').x);
  arktest.assertEQ(1, ext('let x; ({x} = { x: super() })').x);
  arktest.assertEQ(1, ext('let x, y; ({ x: y } = { x } = { x: super() })').x);
})();

(function testInvalidReturn() {
  function* g() { yield 1; }

  let executedXSetter;
  let executedReturn;
  let a = {
    set x(val) {
      executedXSetter = true;
      throw 3;
    }
  };

  // The exception from the execution of g().return() should be suppressed by
  // the setter error.
  executedXSetter = false;
  executedReturn = false;
  g.prototype.return = function() {
    executedReturn = true;
    throw 4;
  };
  arktest.expectThrow('[a.x] = g()', 3);
  arktest.assertTrue(executedXSetter);
  arktest.assertTrue(executedReturn);

  // The exception from g().return() not returning an object should be
  // suppressed by the setter error.
  executedXSetter = false;
  executedReturn = false;
  g.prototype.return = function() {
    arktest.assertTrue(executedReturn);
    return null;
  };
  arktest.expectThrow('[a.x] = g()', 3);
  arktest.assertTrue(executedXSetter);
  arktest.assertTrue(executedReturn);

  // The TypeError from g().return not being a method should suppress the setter
  // error.
  executedXSetter = false;
  g.prototype.return = 'not a method';
  arktest.expectThrow('[a.x] = g()', ((e: Error): boolean => e instanceof TypeError));
  arktest.assertTrue(executedXSetter);

  // The exception from the access of g().return should suppress the setter
  // error.
  executedXSetter = false;
  Object.setPrototypeOf(g.prototype, {
    get return() {
      throw 4;
    }
  });
  arktest.expectThrow('[a.x] = g()', 4);
  arktest.assertTrue(executedXSetter);
})

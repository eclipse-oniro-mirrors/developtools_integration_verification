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

(function testVariableDeclarationsFunction() {
  'use strict';
  let a = function(){};
  arktest.assertEQ('a', a.name);
  let b = () => {};
  arktest.assertEQ('b', b.name);
  const c = ((function(){}));
  arktest.assertEQ('c', c.name);

  let x = function(){};
  let y = () => {};
  let z = function withName() {};
  arktest.assertEQ('x', x.name);
  arktest.assertEQ('y', y.name);
  arktest.assertEQ('withName', z.name);
})();

(function testVariableDeclarationsClass() {
  'use strict';
  let a = class {};
  arktest.assertEQ('a', a.name);
  let b = ((class {}));
  arktest.assertEQ('b', b.name);
  // Should not overwrite name property.
  const c = class { static name() { } }
  arktest.assertEQ('function', typeof c.name);

  let x = class {};
  let y = class NamedClass {};
  arktest.assertEQ('x', x.name);
  arktest.assertEQ('NamedClass', y.name);
})();

(function testObjectProperties() {
  'use strict';
  let obj = {
    a: function() {},
    b: () => {},
    c() { },
    get d() { },
    set d(val) { },
    x: function withName() { },
    y: class { },
    z: class ClassName { },
    ''() {},
    42: function() {},
    4.2: function() {},
    __proto__: function() {},
  };

  arktest.assertEQ('a', obj.a.name);
  arktest.assertEQ('b', obj.b.name);
  arktest.assertEQ('c', obj.c.name);
  const dDescriptor = Object.getOwnPropertyDescriptor(obj, 'd');
  arktest.assertEQ('get d', dDescriptor.get.name);
  arktest.assertEQ('set d', dDescriptor.set.name);
  arktest.assertEQ('withName', obj.x.name);
  arktest.assertEQ('y', obj.y.name);
  arktest.assertEQ('ClassName', obj.z.name);
  arktest.assertEQ('', obj[''].name);
  arktest.assertEQ('42', obj[42].name);
  arktest.assertEQ('4.2', obj[4.2].name);
  arktest.assertEQ('', obj.__proto__.name);
})();

(function testClassProperties() {
  'use strict';
  class C {
    a() { }
    static b() { }
    get c() { }
    set c(val) { }
    ''() { }
    static ''() { }
    42() { }
    static 43() { }
    get 44() { }
    set 44(val) { }
    static get constructor() { }
    static set constructor(val) { }
  };

  arktest.assertEQ('a', C.prototype.a.name);
  arktest.assertEQ('b', C.b.name);
  let descriptor = Object.getOwnPropertyDescriptor(C.prototype, 'c');
  arktest.assertEQ('get c', descriptor.get.name);
  arktest.assertEQ('set c', descriptor.set.name);
  arktest.assertEQ('', C.prototype[''].name);
  arktest.assertEQ('', C[''].name);
  arktest.assertEQ('42', C.prototype[42].name);
  arktest.assertEQ('43', C[43].name);
  let descriptor = Object.getOwnPropertyDescriptor(C.prototype, '44');
  arktest.assertEQ('get 44', descriptor.get.name);
  arktest.assertEQ('set 44', descriptor.set.name);
  let descriptor = Object.getOwnPropertyDescriptor(C, 'constructor');
  arktest.assertEQ('get constructor', descriptor.get.name);
  arktest.assertEQ('set constructor', descriptor.set.name);
})();

(function testComputedProperties() {
  'use strict';
  let a = 'a';
  let b = 'b';
  let sym1 = Symbol('1');
  let sym2 = Symbol('2');
  const sym3 = Symbol('3');
  const symNoDescription = Symbol();
  const proto = '__proto__';
  let obj = {
    ['']: function() {},
    [a]: function() {},
    [sym1]: function() {},
    [sym2]: function withName() {},
    [symNoDescription]: function() {},
    [proto]: function() {},

    get [sym3]() {},
    set [b](val) {},
  };

  arktest.assertEQ('', obj[''].name);
  arktest.assertEQ('a', obj[a].name);
  arktest.assertEQ('[1]', obj[sym1].name);
  arktest.assertEQ('withName', obj[sym2].name);
  arktest.assertEQ('', obj[symNoDescription].name);
  arktest.assertEQ('__proto__', obj[proto].name);

  arktest.assertEQ('get [3]', Object.getOwnPropertyDescriptor(obj, sym3).get.name);
  arktest.assertEQ('set b', Object.getOwnPropertyDescriptor(obj, 'b').set.name);

  const objMethods = {
    ['']() {},
    [a]() {},
    [sym1]() {},
    [symNoDescription]() {},
    [proto]() {},
  };

  arktest.assertEQ('', objMethods[''].name);
  arktest.assertEQ('a', objMethods[a].name);
  arktest.assertEQ('[1]', objMethods[sym1].name);
  arktest.assertEQ('', objMethods[symNoDescription].name);
  arktest.assertEQ('__proto__', objMethods[proto].name);

  class C {
    ['']() { }
    static ''() {}
    [a]() { }
    [sym1]() { }
    static [sym2]() { }
    [symNoDescription]() { }

    get [sym3]() { }
    static set [b](val) { }
  }

  arktest.assertEQ('', C.prototype[''].name);
  arktest.assertEQ('', C[''].name);
  arktest.assertEQ('a', C.prototype[a].name);
  arktest.assertEQ('[1]', C.prototype[sym1].name);
  arktest.assertEQ('[2]', C[sym2].name);
  arktest.assertEQ('', C.prototype[symNoDescription].name);

  arktest.assertEQ('get [3]', Object.getOwnPropertyDescriptor(C.prototype, sym3).get.name);
  arktest.assertEQ('set b', Object.getOwnPropertyDescriptor(C, 'b').set.name);
})();


(function testAssignment() {
  let basicFn;
  let arrowFn;
  let generatorFn;
  let classLit;

  basicFn = function() { return true; };
  arktest.assertEQ('basicFn', basicFn.name);
  const basicFn2 = basicFn;
  arktest.assertEQ('basicFn', basicFn2.name);
  basicFn = function functionWithName() { };
  arktest.assertEQ('functionWithName', basicFn.name);

  arrowFn = x => x;
  arktest.assertEQ('arrowFn', arrowFn.name);
  const arrowFn2 = arrowFn;
  arktest.assertEQ('arrowFn', arrowFn2.name);

  generatorFn = function*() { yield true; };
  arktest.assertEQ('generatorFn', generatorFn.name);
  const generatorFn2 = generatorFn;
  arktest.assertEQ('generatorFn', generatorFn2.name);
  generatorFn = function* generatorWithName() { };
  arktest.assertEQ('generatorWithName', generatorFn.name);

  classLit = class { constructor() {} };
  arktest.assertEQ('classLit', classLit.name);
  const classLit2 = classLit;
  arktest.assertEQ('classLit', classLit2.name);
  classLit = class classWithName { constructor() {} };
  arktest.assertEQ('classWithName', classLit.name);
  classLit = class { constructor() {} static name() {} };
  arktest.assertEQ('function', typeof classLit.name);
  classLit = class { constructor() {} static get name() { return true; } };
  arktest.assertTrue(classLit.name);
  classLit = class { constructor() {} static ['name']() {} };
  arktest.assertEQ('function', typeof classLit.name);
  classLit = class { constructor() {} static get ['name']() { return true; } };
  arktest.assertTrue(classLit.name);
})();

(function testObjectBindingPattern() {
  let {
    a = function() {},
    b = () => {},
    x = function withName() { },
    y = class { },
    z = class ClassName { },
    q = class { static name() { return 42 } },
    foo: bar = function() {},
    inParens = (() => {}),
    inManyParens = ((((() => {})))),
  } = {};
  arktest.assertEQ('a', a.name);
  arktest.assertEQ('b', b.name);
  arktest.assertEQ('withName', x.name);
  arktest.assertEQ('y', y.name);
  arktest.assertEQ('ClassName', z.name);
  arktest.assertEQ('function', typeof q.name);
  arktest.assertEQ('bar', bar.name);
  arktest.assertEQ('inParens', inParens.name)
  arktest.assertEQ('inManyParens', inManyParens.name)
})();

(function testArrayBindingPattern() {
  let [
    a = function() {},
    b = () => {},
    x = function withName() { },
    y = class { },
    z = class ClassName { },
    q = class { static name() { return 42 } },
    inParens = (() => {}),
    inManyParens = ((((() => {})))),
  ] = [];
  arktest.assertEQ('a', a.name);
  arktest.assertEQ('b', b.name);
  arktest.assertEQ('withName', x.name);
  arktest.assertEQ('y', y.name);
  arktest.assertEQ('ClassName', z.name);
  arktest.assertEQ('function', typeof q.name);
  arktest.assertEQ('inParens', inParens.name)
  arktest.assertEQ('inManyParens', inManyParens.name)
})();

(function testObjectAssignmentPattern() {
  let a;
  let b;
  let x;
  let y;
  let z;
  let q;
  ({
    a = function() {},
    b = () => {},
    x = function withName() { },
    y = class { },
    z = class ClassName { },
    q = class { static name() { return 42 } },
    foo: bar = function() {},
    inParens = (() => {}),
    inManyParens = ((((() => {})))),
  } = {});
  arktest.assertEQ('a', a.name);
  arktest.assertEQ('b', b.name);
  arktest.assertEQ('withName', x.name);
  arktest.assertEQ('y', y.name);
  arktest.assertEQ('ClassName', z.name);
  arktest.assertEQ('function', typeof q.name);
  arktest.assertEQ('bar', bar.name);
  arktest.assertEQ('inParens', inParens.name)
  arktest.assertEQ('inManyParens', inManyParens.name)
})();

(function testArrayAssignmentPattern() {
  let a;
  let b;
  let x;
  let y;
  let z;
  let q;
  [
    a = function() {},
    b = () => {},
    x = function withName() { },
    y = class { },
    z = class ClassName { },
    q = class { static name() { return 42 } },
    inParens = (() => {}),
    inManyParens = ((((() => {})))),
  ] = [];
  arktest.assertEQ('a', a.name);
  arktest.assertEQ('b', b.name);
  arktest.assertEQ('withName', x.name);
  arktest.assertEQ('y', y.name);
  arktest.assertEQ('ClassName', z.name);
  arktest.assertEQ('function', typeof q.name);
  arktest.assertEQ('inParens', inParens.name)
  arktest.assertEQ('inManyParens', inManyParens.name)
})();

(function testParameterDestructuring() {
  (function({ a = function() {},
              b = () => {},
              x = function withName() { },
              y = class { },
              z = class ClassName { },
              q = class { static name() { return 42 } },
              foo: bar = function() {},
              inParens = (() => {}),
              inManyParens = ((((() => {})))) }) {
    arktest.assertEQ('a', a.name);
    arktest.assertEQ('b', b.name);
    arktest.assertEQ('withName', x.name);
    arktest.assertEQ('y', y.name);
    arktest.assertEQ('ClassName', z.name);
    arktest.assertEQ('function', typeof q.name);
    arktest.assertEQ('bar', bar.name);
    arktest.assertEQ('inParens', inParens.name)
    arktest.assertEQ('inManyParens', inManyParens.name)
  })({});

  (function([ a = function() {},
              b = () => {},
              x = function withName() { },
              y = class { },
              z = class ClassName { },
              q = class { static name() { return 42 } },
              inParens = (() => {}),
              inManyParens = ((((() => {})))) ]) {
    arktest.assertEQ('a', a.name);
    arktest.assertEQ('b', b.name);
    arktest.assertEQ('withName', x.name);
    arktest.assertEQ('y', y.name);
    arktest.assertEQ('ClassName', z.name);
    arktest.assertEQ('function', typeof q.name);
    arktest.assertEQ('inParens', inParens.name)
    arktest.assertEQ('inManyParens', inManyParens.name)
  })([]);
})();

(function testDefaultParameters() {
  (function(a = function() {},
            b = () => {},
            x = function withName() { },
            y = class { },
            z = class ClassName { },
            q = class { static name() { return 42 } },
            inParens = (() => {}),
            inManyParens = ((((() => {}))))) {
    arktest.assertEQ('a', a.name);
    arktest.assertEQ('b', b.name);
    arktest.assertEQ('withName', x.name);
    arktest.assertEQ('y', y.name);
    arktest.assertEQ('ClassName', z.name);
    arktest.assertEQ('function', typeof q.name);
    arktest.assertEQ('inParens', inParens.name)
    arktest.assertEQ('inManyParens', inManyParens.name)
  })();
})();

(function testComputedNameNotShared() {
  function makeClass(propName) {
    return class {
      static [propName]() {}
    }
  }

  let sym1 = Symbol('1');
  let sym2 = Symbol('2');
  const class1 = makeClass(sym1);
  arktest.assertEQ('[1]', class1[sym1].name);
  const class2 = makeClass(sym2);
  arktest.assertEQ('[2]', class2[sym2].name);
  arktest.assertEQ('[1]', class1[sym1].name);
})();


(function testComputedNamesOnlyAppliedSyntactically() {
  function factory() { return () => {}; }

  let obj = { ['foo']: factory() };
  arktest.assertEQ('', obj.foo.name);
})();


(function testNameNotReflectedInToString() {
  const f = function () {};
  const g = function* () {};
  let obj = {
    ['h']: function () {},
    i: () => {}
  };
  arktest.assertEQ('function () {}', f.toString());
  arktest.assertEQ('function* () {}', g.toString());
  arktest.assertEQ('function () {}', obj.h.toString());
  arktest.assertEQ('() => {}', obj.i.toString());
})();

(function testClassNameOrder() {
  arktest.assertEQ(['length', 'name', 'prototype'], Object.getOwnPropertyNames(class {}));

  let tmp = {'': class {}};
  let tmp = tmp[''];
  arktest.assertEQ(['length', 'name', 'prototype'], Object.getOwnPropertyNames(tmp));

  let name = () => '';
  let tmp = {[name()]: class {}};
  let tmp = tmp[name()];
  arktest.assertEQ(['length', 'name', 'prototype'], Object.getOwnPropertyNames(tmp));

  class A { }
  arktest.assertEQ(['length', 'name', 'prototype'], Object.getOwnPropertyNames(A));

  class B { static foo() { } }
  arktest.assertEQ(['length', 'name', 'prototype', 'foo'], Object.getOwnPropertyNames(B));

  class C { static name() { } static foo() { } }
  arktest.assertEQ(['length', 'name', 'prototype', 'foo'], Object.getOwnPropertyNames(C));
})();

(function testStaticName() {
  class C { static name() { return 42; } }
  arktest.assertEQ(42, C.name());
  arktest.assertEQ(undefined, new C().name);

  class D { static get name() { return 17; } }
  arktest.assertEQ(17, D.name);
  arktest.assertEQ(undefined, new D().name);

  let c = class { static name() { return 42; } }
  arktest.assertEQ(42, c.name());
  arktest.assertEQ(undefined, new c().name);

  let d = class { static get name() { return 17; } }
  arktest.assertEQ(17, d.name);
  arktest.assertEQ(undefined, new d().name);
})();

(function testNonStaticName() {
  class C { name() { return 42; } }
  arktest.assertEQ('C', C.name);
  arktest.assertEQ(42, new C().name());

  class D { get name() { return 17; } }
  arktest.assertEQ('D', D.name);
  arktest.assertEQ(17, new D().name);

  let c = class { name() { return 42; } }
  arktest.assertEQ('c', c.name);
  arktest.assertEQ(42, new c().name());

  let d = class { get name() { return 17; } }
  arktest.assertEQ('d', d.name);
  arktest.assertEQ(17, new d().name);
})();

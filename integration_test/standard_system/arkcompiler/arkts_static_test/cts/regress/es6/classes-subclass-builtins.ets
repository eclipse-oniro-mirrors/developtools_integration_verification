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
expected_out_1: "Semantic error ESE0087: Property '__proto__' does not exist on type 'Object'"
---*/

'use strict';


function checkPrototypeChain(object: Object, constructors: Object[]) {
  let proto = object.__proto__;
  for (let i = 0; i < constructors.length; i++) {
    arktest.assertEQ(constructors[i].prototype, proto);
    arktest.assertEQ(constructors[i], proto.constructor);
    proto = proto.__proto__;
  }
}


(function() {
  class A extends Object {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let s = new A('foo');
  arktest.assertTrue(s instanceof Object);
  arktest.assertTrue(s instanceof A);
  arktest.assertEQ('object', typeof s);
  checkPrototypeChain(s, [A, Object]);
  arktest.assertEQ(42, s.a);
  arktest.assertEQ(4.2, s.d);
  arktest.assertEQ(153, s.o.foo);

  let s1 = new A('bar');
  arktest.assertTrue(ArkTools.haveSameMap(s, s1));


  let n = new A(153);
  arktest.assertTrue(n instanceof Object);
  arktest.assertTrue(n instanceof A);
  arktest.assertEQ('object', typeof s);
  checkPrototypeChain(s, [A, Object]);
  arktest.assertEQ(42, n.a);
  arktest.assertEQ(4.2, n.d);
  arktest.assertEQ(153, n.o.foo);

  let n1 = new A(312);
  arktest.assertTrue(ArkTools.haveSameMap(n, n1));
  arktest.assertTrue(ArkTools.haveSameMap(n, s));


  let b = new A(true);
  arktest.assertTrue(b instanceof Object);
  arktest.assertTrue(b instanceof A);
  arktest.assertEQ('object', typeof s);
  checkPrototypeChain(s, [A, Object]);
  arktest.assertEQ(42, b.a);
  arktest.assertEQ(4.2, b.d);
  arktest.assertEQ(153, b.o.foo);

  let b1 = new A(true);
  arktest.assertTrue(ArkTools.haveSameMap(b, b1));
  arktest.assertTrue(ArkTools.haveSameMap(b, s));

  ArkTools.gc();
})();


(function() {
  class A extends Function {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }
  let sloppyFunc = new A('');
  let strictFunc = new A('\'use strict\';');
  arktest.assertEQ(null, sloppyFunc.caller);
  arktest.expectThrow('strict_f.caller');
  arktest.assertEQ(null, Object.getOwnPropertyDescriptor(sloppyFunc, 'caller').value);
  arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(strictFunc, 'caller'));

  let source = 'this.foo = 113;';

  // Sloppy function
  let sloppyFunc = new A(source);
  arktest.assertTrue(undefined !== sloppyFunc.prototype);

  let sloppyFunc1 = new A('return 312;');
  arktest.assertTrue(ArkTools.haveSameMap(sloppyFunc, sloppyFunc1));

  // Strict function
  let strictFunc = new A('\'use strict\'; ' + source);
  arktest.assertFalse(ArkTools.haveSameMap(strictFunc, sloppyFunc));

  let strictFunc1 = new A('\'use strict\'; return 312;');
  arktest.assertTrue(ArkTools.haveSameMap(strictFunc, strictFunc1));

  ArkTools.gc();
})();


(function() {
  class A extends Boolean {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let o = new A(true);
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof Boolean);
  arktest.assertTrue(o instanceof A);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [A, Boolean]);
  arktest.assertTrue(o.valueOf());
  arktest.assertEQ(42, o.a);
  arktest.assertEQ(4.2, o.d);
  arktest.assertEQ(153, o.o.foo);

  let o1 = new A(false);
  arktest.assertTrue(ArkTools.haveSameMap(o, o1));

  ArkTools.gc();
})();


function testErrorSubclassing(error) {
  class A extends error {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let o = new A('message');
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof error);
  arktest.assertTrue(o instanceof Error);
  arktest.assertTrue(o instanceof A);
  arktest.assertEQ('object', typeof o);
  if (error == Error) {
    checkPrototypeChain(o, [A, Error, Object]);
  } else {
    checkPrototypeChain(o, [A, error, Error, Object]);
  }
  arktest.assertEQ('message', o.message);
  arktest.assertEQ(error.name + ': message', o.toString());
  arktest.assertEQ(42, o.a);
  arktest.assertEQ(4.2, o.d);
  arktest.assertEQ(153, o.o.foo);

  let o1 = new A('achtung!');
  arktest.assertTrue(ArkTools.haveSameMap(o, o1));

  ArkTools.gc();
}


(function() {
  testErrorSubclassing(Error);
  testErrorSubclassing(EvalError);
  testErrorSubclassing(RangeError);
  testErrorSubclassing(ReferenceError);
  testErrorSubclassing(SyntaxError);
  testErrorSubclassing(TypeError);
  testErrorSubclassing(URIError);
})();


(function() {
  class A extends Number {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let o = new A(153);
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof Number);
  arktest.assertTrue(o instanceof A);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [A, Number, Object]);
  arktest.assertEQ(153, o.valueOf());
  arktest.assertEQ(42, o.a);
  arktest.assertEQ(4.2, o.d);
  arktest.assertEQ(153, o.o.foo);

  let o1 = new A(312);
  arktest.assertTrue(ArkTools.haveSameMap(o, o1));

  ArkTools.gc();
})();


(function() {
  class A extends Date {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let o = new A(1234567890);
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof Date);
  arktest.assertTrue(o instanceof A);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [A, Date, Object]);
  arktest.assertEQ(1234567890, o.getTime());
  arktest.assertEQ(42, o.a);
  arktest.assertEQ(4.2, o.d);
  arktest.assertEQ(153, o.o.foo);

  let o1 = new A(2015, 10, 29);
  arktest.assertEQ(2015, o1.getFullYear());
  arktest.assertEQ(10, o1.getMonth());
  arktest.assertEQ(29, o1.getDate());
  arktest.assertTrue(ArkTools.haveSameMap(o, o1));

  ArkTools.gc();
})();


(function() {
  class A extends String {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let o = new A('foo');
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof String);
  arktest.assertTrue(o instanceof A);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [A, String, Object]);

  arktest.assertEQ('foo', o.valueOf());
  arktest.assertEQ(42, o.a);
  arktest.assertEQ(4.2, o.d);
  arktest.assertEQ(153, o.o.foo);

  let o1 = new A('bar');
  arktest.assertTrue(ArkTools.haveSameMap(o, o1));

  ArkTools.gc();
})();


(function() {
  class A extends RegExp {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let o = new A('o(..)h', 'g');
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof RegExp);
  arktest.assertTrue(o instanceof A);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [A, RegExp, Object]);
  arktest.assertTrue(o.test('ouch'));
  let execResult = o.exec('boom! ouch! bam!');
  arktest.assertEQ(2, execResult.length);
  arktest.assertEQ('ouch', execResult[0]);
  arktest.assertEQ('uc', execResult[1]);
  arktest.assertEQ('o(..)h', o.source);
  arktest.assertTrue(o.global);
  arktest.assertFalse(o.ignoreCase);
  arktest.assertFalse(o.multiline);
  arktest.assertEQ(10, o.lastIndex);
  arktest.assertEQ(42, o.a);
  arktest.assertEQ(4.2, o.d);
  arktest.assertEQ(153, o.o.foo);

  let o1 = new A(7);
  arktest.assertTrue(ArkTools.haveSameMap(o, o1));

  ArkTools.gc();
})();


(function TestArraySubclassing() {
  class A extends Array {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let o = new Array(13);
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof Array);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [Array, Object]);
  arktest.assertEQ(13, o.length);

  let o = new A(10);
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof Array);
  arktest.assertTrue(o instanceof A);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [A, Array, Object]);
  arktest.assertEQ(10, o.length);
  arktest.assertEQ(42, o.a);
  arktest.assertEQ(4.2, o.d);
  arktest.assertEQ(153, o.o.foo);

  let o1 = new A(7);
  arktest.assertTrue(ArkTools.haveSameMap(o, o1));
})();


let typedArray = Uint8Array.__proto__;

function testMapSetSubclassing(container, isMap) {
  let keys = [{name: 'banana'}, {name: 'cow'}, {name: 'orange'}, {name: 'chicken'}, {name: 'apple'}];

  class A extends container {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let o = new A();
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof container);
  arktest.assertTrue(o instanceof A);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [A, container, Object]);

  for (let i = 0; i < keys.length; i++) {
    if (isMap) {
      o.set(keys[i], (i + 1) * 11);
    } else {
      o.add(keys[i]);
    }
  }
  o.delete(keys[1]);
  o.delete(keys[3]);

  arktest.assertTrue(o.has(keys[0]));
  arktest.assertFalse(o.has(keys[1]));
  arktest.assertTrue(o.has(keys[2]));
  arktest.assertFalse(o.has(keys[1]));
  arktest.assertTrue(o.has(keys[4]));
  if (isMap) {
    arktest.assertEQ(11, o.get(keys[0]));
    arktest.assertEQ(undefined, o.get(keys[1]));
    arktest.assertEQ(33, o.get(keys[2]));
    arktest.assertEQ(undefined, o.get(keys[3]));
    arktest.assertEQ(55, o.get(keys[4]));
  }
  arktest.assertEQ(42, o.a);
  arktest.assertEQ(4.2, o.d);
  arktest.assertEQ(153, o.o.foo);

  let o1 = new A();
  arktest.assertTrue(ArkTools.haveSameMap(o, o1));

  ArkTools.gc();
}


(function() {
  testMapSetSubclassing(Map, true);
  testMapSetSubclassing(WeakMap, true);
  testMapSetSubclassing(Set, false);
  testMapSetSubclassing(WeakSet, false);
})();


(function() {
  class A extends ArrayBuffer {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let o = new A(16);
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof ArrayBuffer);
  arktest.assertTrue(o instanceof A);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [A, ArrayBuffer, Object]);

  arktest.assertEQ(16, o.byteLength);
  arktest.assertEQ(42, o.a);
  arktest.assertEQ(4.2, o.d);
  arktest.assertEQ(153, o.o.foo);

  let o1 = new A('bar');
  arktest.assertTrue(ArkTools.haveSameMap(o, o1));


  class MyInt32Array extends Int32Array {
    constructor(v, name) {
      super(v);
      this.name = name;
    }
  }

  class MyUint32Array extends Uint32Array {
    constructor(v, name) {
      super(v);
      this.name = name;
    }
  }

  let int32view = new MyInt32Array(o, 'cats');
  let uint32view = new MyUint32Array(o, 'dogs');

  int32view[0] = -2;
  uint32view[1] = 0xffffffff;

  arktest.assertEQ('cats', int32view.name);
  arktest.assertEQ('dogs', uint32view.name);
  arktest.assertEQ(-2, int32view[0]);
  arktest.assertEQ(-1, int32view[1]);
  arktest.assertEQ(0xfffffffe, uint32view[0]);
  arktest.assertEQ(0xffffffff, uint32view[1]);

  ArkTools.gc();
})();


(function() {
  class A extends DataView {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let buffer = new ArrayBuffer(16);
  let o = new A(buffer);
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof DataView);
  arktest.assertTrue(o instanceof A);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [A, DataView, Object]);

  o.setUint32(0, 0xcafebabe, false);
  arktest.assertEQ(0xcafebabe, o.getUint32(0, false));
  arktest.assertEQ(0xbebafeca, o.getUint32(0, true));
  arktest.assertEQ(42, o.a);
  arktest.assertEQ(4.2, o.d);
  arktest.assertEQ(153, o.o.foo);

  let o1 = new A(buffer);
  arktest.assertTrue(ArkTools.haveSameMap(o, o1));

  ArkTools.gc();
})();


(function() {
  let generatorFunction = (function*() {}).constructor;
  class A extends generatorFunction {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }
  let sloppyFunc = new A('yield 153;');
  let strictFunc = new A('\'use strict\'; yield 153;');
  // Unfortunately the difference is not observable from outside.
  arktest.expectThrow('sloppyFunc.caller');
  arktest.expectThrow('strict_f.caller');
  arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(sloppyFunc, 'caller'));
  arktest.assertEQ(undefined, Object.getOwnPropertyDescriptor(strictFunc, 'caller'));

  let source = 'yield 1; yield 1; yield 2; yield 3; yield 5; yield 8;';

  // Sloppy generator function
  let sloppyFunc = new A(source);
  arktest.assertTrue(undefined !== sloppyFunc.prototype);

  let sloppyFunc1 = new A('yield 312;');
  arktest.assertTrue(ArkTools.haveSameMap(sloppyFunc, sloppyFunc1));

  // Strict generator function
  let strictFunc = new A('\'use strict\'; ' + source);
  arktest.assertFalse(ArkTools.haveSameMap(strictFunc, sloppyFunc));

  let strictFunc1 = new A('\'use strict\'; yield 312;');
  arktest.assertTrue(ArkTools.haveSameMap(strictFunc, strictFunc1));

  ArkTools.gc();
})();


(function() {
  class A extends Promise {
    constructor(...args) {
      arktest.assertFalse(new.target === undefined);
      super(...args);
      this.a = 42;
      this.d = 4.2;
      this.o = {foo:153};
    }
  }

  let o = new A(function(resolve, reject) {
    resolve('ok');
  });
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof Promise);
  arktest.assertTrue(o instanceof A);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [A, Promise, Object]);
  arktest.assertEQ(42, o.a);
  arktest.assertEQ(4.2, o.d);
  arktest.assertEQ(153, o.o.foo);
  o.then(
      function(val) { arktest.assertEQ('ok', val); },
      function(reason) { arktest.assertTrue(false); })
    .catch(function(reason) { ArkTools.abortJS('catch handler called: ' + reason); });

  let o1 = new A(function(resolve, reject) {
    reject('fail');
  });
  o1.then(
      function(val) { arktest.assertTrue(false); },
      function(reason) { arktest.assertEQ('fail', reason); })
    .catch(function(reason) { ArkTools.abortJS('catch handler called: ' + reason); });
  arktest.assertTrue(ArkTools.haveSameMap(o, o1));

  ArkTools.gc();
})();


(function() {
  class A extends Boolean {
    constructor() {
      arktest.assertFalse(new.target === undefined);
      super(true);
      this.a00 = 0
      this.a01 = 0
      this.a02 = 0
      this.a03 = 0
      this.a04 = 0
      this.a05 = 0
      this.a06 = 0
      this.a07 = 0
      this.a08 = 0
      this.a09 = 0
      this.a10 = 0
      this.a11 = 0
      this.a12 = 0
      this.a13 = 0
      this.a14 = 0
      this.a15 = 0
      this.a16 = 0
      this.a17 = 0
      this.a18 = 0
      this.a19 = 0
    }
  }

  class B extends A {
    constructor() {
      arktest.assertFalse(new.target === undefined);
      super();
      this.b00 = 0
      this.b01 = 0
      this.b02 = 0
      this.b03 = 0
      this.b04 = 0
      this.b05 = 0
      this.b06 = 0
      this.b07 = 0
      this.b08 = 0
      this.b09 = 0
      this.b10 = 0
      this.b11 = 0
      this.b12 = 0
      this.b13 = 0
      this.b14 = 0
      this.b15 = 0
      this.b16 = 0
      this.b17 = 0
      this.b18 = 0
      this.b19 = 0
    }
  }

  class C extends B {
    constructor() {
      arktest.assertFalse(new.target === undefined);
      super();
      this.c00 = 0
      this.c01 = 0
      this.c02 = 0
      this.c03 = 0
      this.c04 = 0
      this.c05 = 0
      this.c06 = 0
      this.c07 = 0
      this.c08 = 0
      this.c09 = 0
      this.c10 = 0
      this.c11 = 0
      this.c12 = 0
      this.c13 = 0
      this.c14 = 0
      this.c15 = 0
      this.c16 = 0
      this.c17 = 0
      this.c18 = 0
      this.c19 = 0
    }
  }

  let o = new C();
  arktest.assertTrue(o instanceof Object);
  arktest.assertTrue(o instanceof Boolean);
  arktest.assertTrue(o instanceof A);
  arktest.assertTrue(o instanceof B);
  arktest.assertTrue(o instanceof C);
  arktest.assertEQ('object', typeof o);
  checkPrototypeChain(o, [C, B, A, Boolean, Object]);

  ArkTools.gc();
})();


(function() {
  arktest.expectThrow('class A extends undefined {}');
  arktest.expectThrow('class B extends NaN {}');
  arktest.expectThrow('class C extends Infinity {}');
})();


(function() {
  class A extends null {}
  arktest.expectThrow('new A');
})();


(function() {
  class A extends Symbol {}
  arktest.expectThrow('new A');
})();


(function() {
  function f() {}

  let p = f.prototype;
  let p2 = {};
  let o = Reflect.construct(
        Number, [{valueOf() { f.prototype=p2; return 10; }}], f);

  arktest.assertTrue(o.__proto__ === f.prototype);
  arktest.assertTrue(p2 === f.prototype);
  arktest.assertFalse(p === o.__proto__);
  arktest.assertEQ(10, Number.prototype.valueOf.call(o));
})();


(function() {
  function f() {}

  let p = f.prototype;
  let p2 = {};
  let o = Reflect.construct(
        String, [{toString() { f.prototype=p2; return 'biep'; }}], f);

  arktest.assertTrue(o.__proto__ === f.prototype);
  arktest.assertTrue(p2 === o.__proto__);
  arktest.assertFalse(p === o.__proto__);
  arktest.assertEQ('biep', String.prototype.toString.call(o));
})();


(function() {
  function f() {}

  let p = f.prototype;
  let p2 = {};
  let o = Reflect.construct(
        Date, [{valueOf() { f.prototype=p2; return 1447836899614; }}], f);

  arktest.assertTrue(o.__proto__ === f.prototype);
  arktest.assertTrue(p2 === f.prototype);
  arktest.assertFalse(p === o.__proto__);
  arktest.assertEQ(new Date(1447836899614).toString(),
               Date.prototype.toString.call(o));
})();


(function() {
  function f() {}

  let p = f.prototype;
  let p2 = {};
  let o = Reflect.construct(
        Date, [2015, {valueOf() { f.prototype=p2; return 10; }}], f);

  arktest.assertTrue(o.__proto__ === f.prototype);
  arktest.assertTrue(p2 === f.prototype);
  arktest.assertFalse(p === o.__proto__);
  arktest.assertEQ(new Date(2015, 10).getYear(), Date.prototype.getYear.call(o));
  arktest.assertEQ(new Date(2015, 10).getMonth(), Date.prototype.getMonth.call(o));
})();


(function() {
  function f() {}

  let p = f.prototype;
  let p2 = {};
  let o = Reflect.construct(
        DataView, [new ArrayBuffer(100),
                   {valueOf(){ f.prototype=p2; return 5; }}], f);

  let byteOffset = Object.getOwnPropertyDescriptor(
      DataView.prototype, 'byteOffset').get;
  let byteLength = Object.getOwnPropertyDescriptor(
      DataView.prototype, 'byteLength').get;

  arktest.assertTrue(o.__proto__ === f.prototype);
  arktest.assertTrue(p2 === f.prototype);
  arktest.assertFalse(p === o.__proto__);
  arktest.assertEQ(5, byteOffset.call(o));
  arktest.assertEQ(95, byteLength.call(o));
})();


(function() {
  function f() {}

  let p = f.prototype;
  let p2 = {};
  let o = Reflect.construct(
        DataView, [new ArrayBuffer(100),
                   30, {valueOf() { f.prototype=p2; return 5; }}], f);

  let byteOffset = Object.getOwnPropertyDescriptor(
      DataView.prototype, 'byteOffset').get;
  let byteLength = Object.getOwnPropertyDescriptor(
      DataView.prototype, 'byteLength').get;

  arktest.assertTrue(o.__proto__ === f.prototype);
  arktest.assertTrue(p2 === f.prototype);
  arktest.assertFalse(p === o.__proto__);
  arktest.assertEQ(30, byteOffset.call(o));
  arktest.assertEQ(5, byteLength.call(o));
})();


(function() {
  function f() {}

  let p = f.prototype;
  let p2 = {};
  let p3 = {};

  let log = [];

  let pattern = {toString() {
    log.push('tostring');
    f.prototype = p3;
    return 'biep';
  }};

  Object.defineProperty(pattern, Symbol.match, {
    get() { log.push('match'); f.prototype = p2; return false; }});

  let o = Reflect.construct(RegExp, [pattern], f);
  arktest.assertEQ(2, log.length);
  arktest.assertEQ('match', log[0]);
  arktest.assertEQ('tostring', log[1]);
  // TODO(littledan): Is the RegExp constructor correct to create
  // the internal slots and do these type checks this way?
  arktest.expectThrow(() => Object.getOwnPropertyDescriptor(RegExp.prototype,
                                                     'source').get(o),
               TypeError);
  arktest.assertEQ('/undefined/undefined', RegExp.prototype.toString.call(o));
  arktest.assertTrue(o.__proto__ === p2);
  arktest.assertTrue(f.prototype === p3);
})();

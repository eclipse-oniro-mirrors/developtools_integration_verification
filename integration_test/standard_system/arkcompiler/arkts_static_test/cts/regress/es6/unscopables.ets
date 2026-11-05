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
expected_out_1: "Semantic error ESE0202: 'this' cannot be referenced from a static context"
---*/

let global = this;
let globalProto = Object.getPrototypeOf(global);

// Number of objects being tested. There is an assert ensuring this is correct.
const objectCount = 21;


function runTest(f) {
  function restore(object, oldProto) {
    delete object[Symbol.unscopables];
    delete object.x;
    delete object.x_;
    delete object.y;
    delete object.z;
    Object.setPrototypeOf(object, oldProto);
  }

  function getObject(i) {
    let objects = [
      {},
      [],
      function() {},
      function() {
        return arguments;
      }(),
      function() {
        'use strict';
        return arguments;
      }(),
      Object(1),
      Object(true),
      Object('bla'),
      new Date,
      new RegExp,
      new Set,
      new Map,
      new WeakMap,
      new WeakSet,
      new ArrayBuffer(10),
      new Int32Array(5),
      Object,
      Function,
      Date,
      RegExp,
      global
    ];

    arktest.assertEQ(objectCount, objects.length);
    return objects[i];
  }

  // Tests depends on this not being there to start with.
  delete Array.prototype[Symbol.unscopables];

  if (f.length === 1) {
    for (let i = 0; i < objectCount; i++) {
      let object = getObject(i);
      let oldObjectProto = Object.getPrototypeOf(object);
      f(object);
      restore(object, oldObjectProto);
    }
  } else {
    for (let i = 0; i < objectCount; i++) {
      for (let j = 0; j < objectCount; j++) {
        let object = getObject(i);
        let proto = getObject(j);
        if (object === proto) {
          continue;
        }
        let oldObjectProto = Object.getPrototypeOf(object);
        const oldProtoProto = Object.getPrototypeOf(proto);
        f(object, proto);
        restore(object, oldObjectProto);
        restore(proto, oldProtoProto);
      }
    }
  }
}

// Test array first, since other tests are changing
// Array.prototype[Symbol.unscopables].
function testArrayPrototypeUnscopables() {
  const descr = Object.getOwnPropertyDescriptor(Array.prototype,
                                              Symbol.unscopables);
  arktest.assertFalse(descr.enumerable);
  arktest.assertFalse(descr.writable);
  arktest.assertTrue(descr.configurable);
  arktest.assertEQ(null, Object.getPrototypeOf(descr.value));

  const copyWithin = 'local copyWithin';
  const entries = 'local entries';
  const fill = 'local fill';
  const find = 'local find';
  const findIndex = 'local findIndex';
  const flat = 'local flat';
  const flatMap = 'local flatMap';
  const keys = 'local keys';
  const includes = 'local includes';
  const values = 'local values';

  const array = [];
  array.toString = 42;

  with (array) {
    arktest.assertEQ('local copyWithin', copyWithin);
    arktest.assertEQ('local entries', entries);
    arktest.assertEQ('local fill', fill);
    arktest.assertEQ('local find', find);
    arktest.assertEQ('local findIndex', findIndex);
    arktest.assertEQ('local flat', flat);
    arktest.assertEQ('local flatMap', flatMap);
    arktest.assertEQ('local includes', includes);
    arktest.assertEQ('local keys', keys);
    arktest.assertEQ('local values', values);
    arktest.assertEQ(42, toString);
  }
}
testArrayPrototypeUnscopables();



function testBasics(object) {
  let x = 1;
  let y = 2;
  let z = 3;
  object.x = 4;
  object.y = 5;

  with (object) {
    arktest.assertEQ(4, x);
    arktest.assertEQ(5, y);
    arktest.assertEQ(3, z);
  }

  const truthyValues = [true, 1, 'x', {}, Symbol()];
  for (let truthyValue of truthyValues) {
    object[Symbol.unscopables] = {x: truthyValue};
    with (object) {
      arktest.assertEQ(1, x);
      arktest.assertEQ(5, y);
      arktest.assertEQ(3, z);
    }
  }

  const falsyValues = [false, 0, -0, NaN, '', null, undefined];
  for (let falsyValue of falsyValues) {
    object[Symbol.unscopables] = {x: falsyValue, y: true};
    with (object) {
      arktest.assertEQ(4, x);
      arktest.assertEQ(2, y);
      arktest.assertEQ(3, z);
    }
  }

  for (let xFalsy of falsyValues) {
    for (let yFalsy of falsyValues) {
      object[Symbol.unscopables] = {x: xFalsy, y: yFalsy};
      with (object) {
        arktest.assertEQ(4, x);
        arktest.assertEQ(5, y);
        arktest.assertEQ(3, z);
      }
    }
  }
}
runTest(testBasics);


function testUnscopableChain(object) {
  let x = 1;
  object.x = 2;

  with (object) {
    arktest.assertEQ(2, x);
  }

  object[Symbol.unscopables] = {
    __proto__: {x: true}
  };
  with (object) {
    arktest.assertEQ(1, x);
  }

  object[Symbol.unscopables] = {
    __proto__: {x: undefined}
  };
  with (object) {
    arktest.assertEQ(2, x);
  }
}
runTest(testUnscopableChain);


function testBasicsSet(object) {
  let x = 1;
  object.x = 2;

  with (object) {
    arktest.assertEQ(2, x);
  }

  object[Symbol.unscopables] = {x: true};
  with (object) {
    arktest.assertEQ(1, x);
    x = 3;
    arktest.assertEQ(3, x);
  }

  arktest.assertEQ(3, x);
  arktest.assertEQ(2, object.x);
}
runTest(testBasicsSet);


function testOnProto(object, proto) {
  let x = 1;
  let y = 2;
  let z = 3;
  proto.x = 4;

  Object.setPrototypeOf(object, proto);
  object.y = 5;

  with (object) {
    arktest.assertEQ(4, x);
    arktest.assertEQ(5, y);
    arktest.assertEQ(3, z);
  }

  proto[Symbol.unscopables] = {x: true};
  with (object) {
    arktest.assertEQ(1, x);
    arktest.assertEQ(5, y);
    arktest.assertEQ(3, z);
  }

  object[Symbol.unscopables] = {y: true};
  with (object) {
    arktest.assertEQ(4, x);
    arktest.assertEQ(2, y);
    arktest.assertEQ(3, z);
  }

  proto[Symbol.unscopables] = {y: true};
  object[Symbol.unscopables] = {x: true};
  with (object) {
    arktest.assertEQ(1, x);
    arktest.assertEQ(5, y);
    arktest.assertEQ(3, z);
  }

  proto[Symbol.unscopables] = {y: true};
  object[Symbol.unscopables] = {x: true, y: undefined};
  with (object) {
    arktest.assertEQ(1, x);
    arktest.assertEQ(5, y);
    arktest.assertEQ(3, z);
  }
}
runTest(testOnProto);


function testSetBlockedOnProto(object, proto) {
  let x = 1;
  object.x = 2;

  with (object) {
    arktest.assertEQ(2, x);
  }

  Object.setPrototypeOf(object, proto);
  proto[Symbol.unscopables] = {x: true};
  with (object) {
    arktest.assertEQ(1, x);
    x = 3;
    arktest.assertEQ(3, x);
  }

  arktest.assertEQ(3, x);
  arktest.assertEQ(2, object.x);
}
runTest(testSetBlockedOnProto);


function testNonObject(object) {
  let x = 1;
  let y = 2;
  object.x = 3;
  object.y = 4;

  object[Symbol.unscopables] = 'xy';
  with (object) {
    arktest.assertEQ(3, x);
    arktest.assertEQ(4, y);
  }

  object[Symbol.unscopables] = null;
  with (object) {
    arktest.assertEQ(3, x);
    arktest.assertEQ(4, y);
  }
}
runTest(testNonObject);


function testChangeDuringWith(object) {
  let x = 1;
  let y = 2;
  object.x = 3;
  object.y = 4;

  with (object) {
    arktest.assertEQ(3, x);
    arktest.assertEQ(4, y);
    object[Symbol.unscopables] = {x: true};
    arktest.assertEQ(1, x);
    arktest.assertEQ(4, y);
  }
}
runTest(testChangeDuringWith);


function testChangeDuringWithWithPossibleOptimization(object) {
  let x = 1;
  object.x = 2;
  with (object) {
    for (let i = 0; i < 1000; i++) {
      if (i === 500) { object[Symbol.unscopables] = {x: true}; }
      arktest.assertEQ(i < 500 ? 2: 1, x);
    }
  }
}
testChangeDuringWithWithPossibleOptimization({});


function testChangeDuringWithWithPossibleOptimization2(object) {
  let x = 1;
  object.x = 2;
  object[Symbol.unscopables] = {x: true};
  with (object) {
    for (let i = 0; i < 1000; i++) {
      if (i === 500) { delete object[Symbol.unscopables]; }
      arktest.assertEQ(i < 500 ? 1 : 2, x);
    }
  }
}
testChangeDuringWithWithPossibleOptimization2({});


function testChangeDuringWithWithPossibleOptimization3(object) {
  let x = 1;
  object.x = 2;
  object[Symbol.unscopables] = {};
  with (object) {
    for (let i = 0; i < 1000; i++) {
      if (i === 500) { object[Symbol.unscopables].x = true; }
      arktest.assertEQ(i < 500 ? 2 : 1, x);
    }
  }
}
testChangeDuringWithWithPossibleOptimization3({});


function testChangeDuringWithWithPossibleOptimization4(object) {
  let x = 1;
  object.x = 2;
  object[Symbol.unscopables] = {x: true};
  with (object) {
    for (let i = 0; i < 1000; i++) {
      if (i === 500) {
        delete object[Symbol.unscopables].x;
      }
      arktest.assertEQ(i < 500 ? 1 : 2, x);
    }
  }
}
testChangeDuringWithWithPossibleOptimization4({});


function testChangeDuringWithWithPossibleOptimization4(object) {
  let x = 1;
  object.x = 2;
  object[Symbol.unscopables] = {x: true};
  with (object) {
    for (let i = 0; i < 1000; i++) {
      if (i === 500) { object[Symbol.unscopables].x = undefined; }
      arktest.assertEQ(i < 500 ? 1 : 2, x);
    }
  }
}
testChangeDuringWithWithPossibleOptimization4({});


function testAccessorReceiver(object, proto) {
  let x = 'local';

  Object.defineProperty(proto, 'x', {
    get: function() {
      arktest.assertEQ(object, this);
      return this.x_;
    },
    configurable: true
  });
  proto.x_ = 'proto';

  Object.setPrototypeOf(object, proto);
  proto.x_ = 'object';

  with (object) {
    arktest.assertEQ('object', x);
  }
}
runTest(testAccessorReceiver);


function testUnscopablesGetter(object) {
  // This test gets really messy when object is the global since the assert
  // functions are properties on the global object and the call count gets
  // completely different.
  if (object === global) { return; }

  let x = 'local';
  object.x = 'object';

  let callCount = 0;
  Object.defineProperty(object, Symbol.unscopables, {
    get: function() {
      callCount++;
      return {};
    },
    configurable: true
  });
  with (object) {
    arktest.assertEQ('object', x);
  }
  // Once for HasBinding
  arktest.assertEQ(1, callCount);

  callCount = 0;
  Object.defineProperty(object, Symbol.unscopables, {
    get: function() {
      callCount++;
      return {x: true};
    },
    configurable: true
  });
  with (object) {
    arktest.assertEQ('local', x);
  }
  // Once for HasBinding
  arktest.assertEQ(1, callCount);

  callCount = 0;
  Object.defineProperty(object, Symbol.unscopables, {
    get: function() {
      callCount++;
      return callCount == 1 ? {} : {x: true};
    },
    configurable: true
  });
  with (object) {
    x = 1;
  }
  // Once for HasBinding
  arktest.assertEQ(1, callCount);
  arktest.assertEQ(1, object.x);
  arktest.assertEQ('local', x);
  with (object) {
    x = 2;
  }
  // One more HasBinding.
  arktest.assertEQ(2, callCount);
  arktest.assertEQ(1, object.x);
  arktest.assertEQ(2, x);
}
runTest(testUnscopablesGetter);


let global = this;
function testUnscopablesGetter2() {
  let x = 'local';

  let globalProto = Object.getPrototypeOf(global);
  const protos = [{}, [], function() {}, global];
  let objects = [{}, [], function() {}];

  protos.forEach(function(proto) {
    objects.forEach(function(object) {
      Object.defineProperty(proto, 'x', {
        get: function() {
          arktest.assertEQ(object, this);
          return 'proto';
        },
        configurable: true
      });

      object.__proto__ = proto;
      Object.defineProperty(object, 'x', {
        get: function() {
          arktest.assertEQ(object, this);
          return 'object';
        },
        configurable: true
      });

      with (object) {
        arktest.assertEQ('object', x);
      }

      object[Symbol.unscopables] = {x: true};
      with (object) {
        arktest.assertEQ('local', x);
      }

      delete proto[Symbol.unscopables];
      delete object[Symbol.unscopables];
    });
  });

  delete global.x;
  Object.setPrototypeOf(global, globalProto);
}
testUnscopablesGetter2();


function testSetterOnBlocklisted(object, proto) {
  let x = 'local';
  Object.defineProperty(proto, 'x', {
    set: function(x) {
      arktest.assertTrue(false);
    },
    get: function() {
      return 'proto';
    },
    configurable: true
  });
  Object.setPrototypeOf(object, proto);
  Object.defineProperty(object, 'x', {
    get: function() {
      return this.x_;
    },
    set: function(x) {
      this.x_ = x;
    },
    configurable: true
  });
  object.x_ = 1;

  with (object) {
    x = 2;
    arktest.assertEQ(2, x);
  }

  arktest.assertEQ(2, object.x);

  object[Symbol.unscopables] = {x: true};

  with (object) {
    x = 3;
    arktest.assertEQ(3, x);
  }

  arktest.assertEQ(2, object.x);
}
runTest(testSetterOnBlocklisted);


function testObjectsAsUnscopables(object, unscopables) {
  let x = 1;
  object.x = 2;

  with (object) {
    arktest.assertEQ(2, x);
    object[Symbol.unscopables] = unscopables;
    arktest.assertEQ(2, x);
  }
}
runTest(testObjectsAsUnscopables);


function testAccessorOnUnscopables(object) {
  let x = 1;
  object.x = 2;

  let calls = 0;
  let unscopables = {
    get x() {
      calls++;
      return calls === 1 ? true : undefined;
    }
  };

  with (object) {
    arktest.assertEQ(2, x);
    object[Symbol.unscopables] = unscopables;
    arktest.assertEQ(1, x);
    arktest.assertEQ(2, x);
  }
  arktest.assertEQ(2, calls);
}
runTest(testAccessorOnUnscopables);


function testLengthUnscopables(object, proto) {
  let length = 2;
  with (object) {
    arktest.assertEQ(1, length);
    object[Symbol.unscopables] = {length: true};
    arktest.assertEQ(2, length);
    delete object[Symbol.unscopables];
    arktest.assertEQ(1, length);
  }
}
testLengthUnscopables([1], Array.prototype);
testLengthUnscopables(function(x) {}, Function.prototype);
testLengthUnscopables(Object('x'), String.prototype);


function testFunctionNameUnscopables(object) {
  const name = 'local';
  with (object) {
    arktest.assertEQ('f', name);
    object[Symbol.unscopables] = {name: true};
    arktest.assertEQ('local', name);
    delete object[Symbol.unscopables];
    arktest.assertEQ('f', name);
  }
}
testFunctionNameUnscopables(function f() {});


function testFunctionPrototypeUnscopables() {
  const prototype = 'local';
  let f = function() {};
  let g = function() {};
  Object.setPrototypeOf(f, g);
  const fp = f.prototype;
  const gp = g.prototype;
  with (f) {
    arktest.assertEQ(fp, prototype);
    f[Symbol.unscopables] = {prototype: true};
    arktest.assertEQ('local', prototype);
    delete f[Symbol.unscopables];
    arktest.assertEQ(fp, prototype);
  }
}
testFunctionPrototypeUnscopables(function() {});


function testFunctionArgumentsUnscopables() {
  let func = function() {
    let arguments = 'local';
    const args = func.arguments;
    with (func) {
      arktest.assertEQ(args, arguments);
      func[Symbol.unscopables] = {arguments: true};
      arktest.assertEQ('local', arguments);
      delete func[Symbol.unscopables];
      arktest.assertEQ(args, arguments);
    }
  }
  func(1);
}
testFunctionArgumentsUnscopables();


function testArgumentsLengthUnscopables() {
  let func = function() {
    let length = 'local';
    with (arguments) {
      arktest.assertEQ(1, length);
      arguments[Symbol.unscopables] = {length: true};
      arktest.assertEQ('local', length);
    }
  }
  func(1);
}
testArgumentsLengthUnscopables();


function testFunctionCallerUnscopables() {
  let func = function() {
    const caller = 'local';
    with (func) {
      arktest.assertEQ(testFunctionCallerUnscopables, caller);
      func[Symbol.unscopables] = {caller: true};
      arktest.assertEQ('local', caller);
      delete func[Symbol.unscopables];
      arktest.assertEQ(testFunctionCallerUnscopables, caller);
    }
  }
  func(1);
}
testFunctionCallerUnscopables();


function testGetUnscopablesGetterThrows() {
  let object = {
    get x() {
      arktest.assertTrue(false);
    }
  };
  function CustomError() {}
  Object.defineProperty(object, Symbol.unscopables, {
    get: function() {
      throw new CustomError();
    }
  });
  arktest.expectThrow(function() {
    with (object) {
      x;
    }
  }, CustomError);
}
testGetUnscopablesGetterThrows();


function testGetUnscopablesGetterThrows2() {
  let object = {
    get x() {
      arktest.assertTrue(false);
    }
  };
  function CustomError() {}

  object[Symbol.unscopables] = {
    get x() {
      throw new CustomError();
    }
  };
  arktest.expectThrow(function() {
    with (object) {
      x;
    }
  }, CustomError);
}
testGetUnscopablesGetterThrows();

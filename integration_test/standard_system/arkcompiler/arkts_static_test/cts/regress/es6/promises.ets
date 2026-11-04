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


// Make sure we don't rely on functions patchable by monkeys.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property 'prototype' does not exist on type 'Function'"
---*/

const call = Function.prototype.call.call.bind(Function.prototype.call)
let getOwnPropertyNames = Object.getOwnPropertyNames;
const defineProperty = Object.defineProperty;
const numberPrototype = Number.prototype;
const symbolIterator = Symbol.iterator;

function promiseUnreachable() {
  ArkTools.abortJS('Failure: unreachable');
}

(function() {
  // Test before clearing global (fails otherwise)
  arktest.assertEQ('[object Promise]',
      Object.prototype.toString.call(new Promise(function() {})));
})();


function clear(o) {
  if (o === null || (typeof o !== 'object' && typeof o !== 'function')) {
    return
  }
  clear(o.__proto__)
  const properties = getOwnPropertyNames(o)
  for (let i in properties) {
    // Do not clobber Object.prototype.toString, which is used by tests.
    if (properties[i] === 'toString') { continue; }
    clearProp(o, properties[i])
  }
}

function clearProp(o, name) {
  const poisoned = {caller: 0, callee: 0, arguments: 0}
  try {
    const x = o[name]
    o[name] = undefined
    clear(x)
  } catch(e) {} // arktest.assertTrue(name in poisoned) }
}

// Find intrinsics and null them out.
let globals = Object.getOwnPropertyNames(this)
const allowlist = {
  Promise: true,
  TypeError: true,
  String: true,
  JSON: true,
  Error: true,
  MjsUnitAssertionError: true
};

for (let i in globals) {
  let name = globals[i]
  if (name in allowlist || name[0] === name[0].toLowerCase()) {
    delete globals[i]
  }
}
for (let i in globals) {
  if (globals[i]) { clearProp(this, globals[i]) }
}


function defer(constructor) {
  let resolve;
  let reject;
  let promise = new constructor((res, rej) => { resolve = res; reject = rej });
  return { promise, resolve, reject };
}

let asyncAssertsExpected = 0;

function assertAsyncRan() { ++asyncAssertsExpected }

function assertAsync(b, s) {
  if (b) {
    print(s, 'succeeded')
  } else {
    ArkTools.abortJS(s + ' FAILED!')  // Simply throwing here will have no effect.
  }
  --asyncAssertsExpected
}

function assertLater(f, name) {
  arktest.assertFalse(f()); // should not be true synchronously
  ++asyncAssertsExpected;
  let iterations = 0;
  function runAssertion() {
    if (f()) {
      print(name, 'succeeded');
      --asyncAssertsExpected;
    } else if (iterations++ < 10) {
      ArkTools.enqueueMicrotask(runAssertion);
    } else {
      ArkTools.abortJS(name + ' FAILED!');
    }
  }
  ArkTools.enqueueMicrotask(runAssertion);
}

function assertAsyncDone(iteration) {
  let iteration = iteration || 0;
  ArkTools.enqueueMicrotask(function() {
    if (asyncAssertsExpected === 0)
      assertAsync(true, 'all')
    else if (iteration > 10)  { // Shouldn't take more. }
      assertAsync(false, 'all... ' + asyncAssertsExpected)
    else {
      assertAsyncDone(iteration + 1)
      }
  });
}

(function() {
  arktest.expectThrow(function() { Promise(function() {}) }, ((e: Error): boolean => e instanceof TypeError))
})();

(function() {
  arktest.assertTrue(new Promise(function() {}) instanceof Promise)
})();

(function() {
  arktest.expectThrow(function() { new Promise(5) }, ((e: Error): boolean => e instanceof TypeError))
})();

(function() {
  arktest.expectNoThrow(function() { new Promise(function() { throw 5 }) })
})();

(function() {
  (new Promise(function() { throw 5 })).then(
    promiseUnreachable,
    function(r) { assertAsync(r === 5, 'new-throw') }
  )
  assertAsyncRan()
})();

(function() {
  Promise.resolve(5);
  Promise.resolve(5).then(undefined, promiseUnreachable).then(
    function(x) { assertAsync(x === 5, 'resolved/then-nohandler') },
    promiseUnreachable
  )
  assertAsyncRan()
})();

(function() {
  Promise.resolve(5).then(undefined, promiseUnreachable).then(
    function(x) { assertAsync(x === 5, 'resolved/then-nohandler-undefined') },
    promiseUnreachable
  )
  assertAsyncRan()
  Promise.resolve(6).then(null, promiseUnreachable).then(
    function(x) { assertAsync(x === 6, 'resolved/then-nohandler-null') },
    promiseUnreachable
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(
    function(x) { assertAsync(x === 5, 'resolved/then') },
    promiseUnreachable
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.reject(5)
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(
    promiseUnreachable,
    function(x) { assertAsync(x === 5, 'rejected/then') }
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(function(x) { return x }, promiseUnreachable).then(
    function(x) { assertAsync(x === 5, 'resolved/then/then') },
    promiseUnreachable
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(function(x){ return Promise.resolve(x+1) }, promiseUnreachable).then(
    function(x) { assertAsync(x === 6, 'resolved/then/then2') },
    promiseUnreachable
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(function(x) { throw 6 }, promiseUnreachable).then(
    promiseUnreachable,
    function(x) { assertAsync(x === 6, 'resolved/then-throw/then') }
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(function(x) { throw 6 }, promiseUnreachable).then(
    promiseUnreachable,
    function(x) { assertAsync(x === 6, 'resolved/then-throw/then') }
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(function(x) { throw 6 }, promiseUnreachable).then(
    promiseUnreachable,
    function(x) { assertAsync(x === 6, 'resolved/then-throw/then') }
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(function(x) { throw 6 }, promiseUnreachable).then(
    promiseUnreachable,
    function(x) { assertAsync(x === 6, 'resolved/then-throw/then') }
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = {then: function(onResolve, onReject) { onResolve(p1) }}
  let p3 = Promise.resolve(p2)
  p3.then(
    function(x) { assertAsync(x === 5, 'resolved/thenable/then') },
    promiseUnreachable
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = {then: function(onResolve, onReject) { onResolve(p1) }}
  let p3 = Promise.resolve(p2)
  p3.then(
    function(x) { assertAsync(x === 5, 'resolved/thenable/then') },
    promiseUnreachable
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.reject(5)
  let p2 = {then: function(onResolve, onReject) { onResolve(p1) }}
  let p3 = Promise.resolve(p2)
  p3.then(
    promiseUnreachable,
    function(x) { assertAsync(x === 5, 'rejected/thenable/then') }
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.reject(5)
  let p2 = {then: function(onResolve, onReject) { onResolve(p1) }}
  let p3 = Promise.resolve(p2)
  p3.then(
    promiseUnreachable,
    function(x) { assertAsync(x === 5, 'rejected/thenable/then') }
  )
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(
    function(x) { assertAsync(x === 5, 'then/resolve') },
    promiseUnreachable
  )
  deferred.resolve(5)
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(
    function(x) { assertAsync(x === 5, 'then/resolve') },
    promiseUnreachable
  )
  deferred.resolve(5)
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(
    promiseUnreachable,
    function(x) { assertAsync(x === 5, 'then/reject') }
  )
  deferred.reject(5)
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = Promise.resolve(p1)
  let p3 = Promise.resolve(p2)
  p3.then(
    promiseUnreachable,
    function(x) { assertAsync(x === 5, 'then/reject') }
  )
  deferred.reject(5)
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = p1.then(1, 2)
  p2.then(
    function(x) { assertAsync(x === 5, 'then/resolve-non-function') },
    promiseUnreachable
  )
  deferred.resolve(5)
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = p1.then(1, 2)
  p2.then(
    promiseUnreachable,
    function(x) { assertAsync(x === 5, 'then/reject-non-function') }
  )
  deferred.reject(5)
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = {then: function(onResolve, onReject) { onResolve(p1) }}
  let p3 = Promise.resolve(p2)
  p3.then(
    function(x) { assertAsync(x === 5, 'then/resolve/thenable') },
    promiseUnreachable
  )
  deferred.resolve(5)
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = {then: function(onResolve, onReject) { onResolve(p1) }}
  let p3 = Promise.resolve(p2)
  p3.then(
    function(x) { assertAsync(x === 5, 'then/resolve/thenable') },
    promiseUnreachable
  )
  deferred.resolve(5)
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = {then: function(onResolve, onReject) { onResolve(p1) }}
  let p3 = Promise.resolve(p2)
  p3.then(
    promiseUnreachable,
    function(x) { assertAsync(x === 5, 'then/reject/thenable') }
  )
  deferred.reject(5)
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = {then: function(onResolve, onReject) { onResolve(p1) }}
  let p3 = Promise.resolve(p2)
  p3.then(
    promiseUnreachable,
    function(x) { assertAsync(x === 5, 'then/reject/thenable') }
  )
  deferred.reject(5)
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = Promise.resolve(p1)
  let deferred = defer(Promise)
  let p3 = deferred.promise
  p3.then(
    function(x) { assertAsync(x === 5, 'then/resolve2') },
    promiseUnreachable
  )
  deferred.resolve(p2)
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = Promise.resolve(p1)
  let deferred = defer(Promise)
  let p3 = deferred.promise
  p3.then(
    function(x) { assertAsync(x === 5, 'then/resolve2') },
    promiseUnreachable
  )
  deferred.resolve(p2)
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = Promise.resolve(p1)
  let deferred = defer(Promise)
  let p3 = deferred.promise
  p3.then(
    promiseUnreachable,
    function(x) { assertAsync(x === 5, 'then/reject2') }
  )
  deferred.reject(5)
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = Promise.resolve(p1)
  let deferred = defer(Promise)
  let p3 = deferred.promise
  p3.then(
    promiseUnreachable,
    function(x) { assertAsync(x === 5, 'then/reject2') }
  )
  deferred.reject(5)
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = {then: function(onResolve, onReject) { onResolve(p1) }}
  let deferred = defer(Promise)
  let p3 = deferred.promise
  p3.then(
    function(x) { assertAsync(x === 5, 'then/resolve/thenable2') },
    promiseUnreachable
  )
  deferred.resolve(p2)
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(5)
  let p2 = {then: function(onResolve, onReject) { onResolve(p1) }}
  let deferred = defer(Promise)
  let p3 = deferred.promise
  p3.then(
    function(x) { assertAsync(x === 5, 'then/resolve/thenable2') },
    promiseUnreachable
  )
  deferred.resolve(p2)
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(0)
  let p2 = p1.then(function(x) { return p2 }, promiseUnreachable)
  p2.then(
    promiseUnreachable,
    function(r) { assertAsync(r instanceof TypeError, 'cyclic/then') }
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(0)
  let p2 = p1.then(function(x) { return p2 }, promiseUnreachable)
  p2.then(
    promiseUnreachable,
    function(r) { assertAsync(r instanceof TypeError, 'cyclic/then') }
  )
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p = deferred.promise
  deferred.resolve(p)
  p.then(
    promiseUnreachable,
    function(r) { assertAsync(r instanceof TypeError, 'cyclic/deferred/then') }
  )
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p = deferred.promise
  deferred.resolve(p)
  p.then(
    promiseUnreachable,
    function(r) { assertAsync(r instanceof TypeError, 'cyclic/deferred/then') }
  )
  assertAsyncRan()
})();

(function() {
  Promise.all([]).then(
    function(x) { assertAsync(x.length === 0, 'all/resolve/empty') },
    promiseUnreachable
  )
  assertAsyncRan()
})();

(function() {
  function testPromiseAllNonIterable(value) {
    Promise.all(value).then(
        promiseUnreachable,
        function(r) {
          assertAsync(r instanceof TypeError, 'all/non iterable');
        });
    assertAsyncRan();
  }
  testPromiseAllNonIterable(null);
  testPromiseAllNonIterable(undefined);
  testPromiseAllNonIterable({});
  testPromiseAllNonIterable(42);
})();

(function() {
  Promise.all({[symbolIterator](){ return null; }}).then(
    promiseUnreachable,
    function(r) {
      assertAsync(r instanceof TypeError, 'all/non iterable');
    });
  assertAsyncRan();
})();

(function() {
  let deferred = defer(Promise);
  let p = deferred.promise;
  function* f() {
    yield 1;
    yield p;
    yield 3;
  }
  Promise.all(f()).then(
      function(x) {
        assertAsync(x.length === 3, 'all/resolve/iterable');
        assertAsync(x[0] === 1, 'all/resolve/iterable/0');
        assertAsync(x[1] === 2, 'all/resolve/iterable/1');
        assertAsync(x[2] === 3, 'all/resolve/iterable/2');
      },
      promiseUnreachable);
  deferred.resolve(2);
  assertAsyncRan();
  assertAsyncRan();
  assertAsyncRan();
  assertAsyncRan();
})();


(function() {
  let deferred1 = defer(Promise)
  let p1 = deferred1.promise
  let deferred2 = defer(Promise)
  let p2 = deferred2.promise
  let deferred3 = defer(Promise)
  let p3 = deferred3.promise
  Promise.all([p1, p2, p3]).then(
    function(x) {
      assertAsync(x.length === 3, 'all/resolve')
      assertAsync(x[0] === 1, 'all/resolve/0')
      assertAsync(x[1] === 2, 'all/resolve/1')
      assertAsync(x[2] === 3, 'all/resolve/2')
    },
    promiseUnreachable
  )
  deferred1.resolve(1)
  deferred3.resolve(3)
  deferred2.resolve(2)
  assertAsyncRan()
  assertAsyncRan()
  assertAsyncRan()
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = Promise.resolve(2)
  let p3 = defer(Promise).promise
  Promise.all([p1, p2, p3]).then(
    promiseUnreachable,
    promiseUnreachable
  )
  deferred.resolve(1)
})();

(function() {
  let deferred1 = defer(Promise)
  let p1 = deferred1.promise
  let deferred2 = defer(Promise)
  let p2 = deferred2.promise
  let deferred3 = defer(Promise)
  let p3 = deferred3.promise
  Promise.all([p1, p2, p3]).then(
    promiseUnreachable,
    function(x) { assertAsync(x === 2, 'all/reject') }
  )
  deferred1.resolve(1)
  deferred3.resolve(3)
  deferred2.reject(2)
  assertAsyncRan()
})();

(function() {
  'use strict';
  let getCalls = 0;
  let funcCalls = 0;
  let nextCalls = 0;
  defineProperty(numberPrototype, symbolIterator, {
    get: function() {
      arktest.assertEQ('number', typeof this);
      getCalls++;
      return function() {
        arktest.assertEQ('number', typeof this);
        funcCalls++;
        let n = this;
        let i = 0
        return {
          next() {
            nextCalls++;
            return {value: i++, done: i > n};
          }
        };
      };
    },
    configurable: true
  });

  Promise.all(3).then(
      function(x) {
        assertAsync(x.length === 3, 'all/iterable/number/length');
        assertAsync(x[0] === 0, 'all/iterable/number/0');
        assertAsync(x[1] === 1, 'all/iterable/number/1');
        assertAsync(x[2] === 2, 'all/iterable/number/2');
      },
      promiseUnreachable);
  delete numberPrototype[symbolIterator];

  arktest.assertEQ(getCalls, 1);
  arktest.assertEQ(funcCalls, 1);
  arktest.assertEQ(nextCalls, 3 + 1);  // + 1 for {done: true}
  assertAsyncRan();
  assertAsyncRan();
  assertAsyncRan();
  assertAsyncRan();
})();


(function() {
  Promise.race([]).then(
    promiseUnreachable,
    promiseUnreachable
  )
})();

(function() {
  let p1 = Promise.resolve(1)
  let p2 = Promise.resolve(2)
  let p3 = Promise.resolve(3)
  Promise.race([p1, p2, p3]).then(
    function(x) { assertAsync(x === 1, 'resolved/one') },
    promiseUnreachable
  )
  assertAsyncRan()
})();

(function() {
  let p1 = Promise.resolve(1)
  let p2 = Promise.resolve(2)
  let p3 = Promise.resolve(3)
  Promise.race([0, p1, p2, p3]).then(
    function(x) { assertAsync(x === 0, 'resolved-const/one') },
    promiseUnreachable
  )
  assertAsyncRan()
})();

(function() {
  let deferred1 = defer(Promise)
  let p1 = deferred1.promise
  let deferred2 = defer(Promise)
  let p2 = deferred2.promise
  let deferred3 = defer(Promise)
  let p3 = deferred3.promise
  Promise.race([p1, p2, p3]).then(
    function(x) { assertAsync(x === 3, 'one/resolve') },
    promiseUnreachable
  )
  deferred3.resolve(3)
  deferred1.resolve(1)
  assertAsyncRan()
})();

(function() {
  let deferred = defer(Promise)
  let p1 = deferred.promise
  let p2 = Promise.resolve(2)
  let p3 = defer(Promise).promise
  Promise.race([p1, p2, p3]).then(
    function(x) { assertAsync(x === 2, 'resolved/one') },
    promiseUnreachable
  )
  deferred.resolve(1)
  assertAsyncRan()
})();

(function() {
  let deferred1 = defer(Promise)
  let p1 = deferred1.promise
  let deferred2 = defer(Promise)
  let p2 = deferred2.promise
  let deferred3 = defer(Promise)
  let p3 = deferred3.promise
  Promise.race([p1, p2, p3]).then(
    function(x) { assertAsync(x === 3, 'one/resolve/reject') },
    promiseUnreachable
  )
  deferred3.resolve(3)
  deferred1.reject(1)
  assertAsyncRan()
})();

(function() {
  let deferred1 = defer(Promise)
  let p1 = deferred1.promise
  let deferred2 = defer(Promise)
  let p2 = deferred2.promise
  let deferred3 = defer(Promise)
  let p3 = deferred3.promise
  Promise.race([p1, p2, p3]).then(
    promiseUnreachable,
    function(x) { assertAsync(x === 3, 'one/reject/resolve') }
  )
  deferred3.reject(3)
  deferred1.resolve(1)
  assertAsyncRan()
})();


(function() {
  function testPromiseRaceNonIterable(value) {
    Promise.race(value).then(
        promiseUnreachable,
        function(r) {
          assertAsync(r instanceof TypeError, 'race/non iterable');
        });
    assertAsyncRan();
  }
  testPromiseRaceNonIterable(null);
  testPromiseRaceNonIterable(undefined);
  testPromiseRaceNonIterable({});
  testPromiseRaceNonIterable(42);
})();


(function() {
  let deferred1 = defer(Promise)
  let p1 = deferred1.promise
  let deferred2 = defer(Promise)
  let p2 = deferred2.promise
  let deferred3 = defer(Promise)
  let p3 = deferred3.promise
  function* f() {
    yield p1;
    yield p2;
    yield p3;
  }
  Promise.race(f()).then(
    function(x) { assertAsync(x === 3, 'race/iterable/resolve/reject') },
    promiseUnreachable
  )
  deferred3.resolve(3)
  deferred1.reject(1)
  assertAsyncRan()
})();

(function() {
  let deferred1 = defer(Promise)
  let p1 = deferred1.promise
  let deferred2 = defer(Promise)
  let p2 = deferred2.promise
  let deferred3 = defer(Promise)
  let p3 = deferred3.promise
  function* f() {
    yield p1;
    yield p2;
    yield p3;
  }
  Promise.race(f()).then(
    promiseUnreachable,
    function(x) { assertAsync(x === 3, 'race/iterable/reject/resolve') }
  )
  deferred3.reject(3)
  deferred1.resolve(1)
  assertAsyncRan()
})();

(function() {
  'use strict';
  let getCalls = 0;
  let funcCalls = 0;
  let nextCalls = 0;
  defineProperty(numberPrototype, symbolIterator, {
    get: function() {
      arktest.assertEQ('number', typeof this);
      getCalls++;
      return function() {
        arktest.assertEQ('number', typeof this);
        funcCalls++;
        let n = this;
        let i = 0
        return {
          next() {
            nextCalls++;
            return {value: i++, done: i > n};
          }
        };
      };
    },
    configurable: true
  });

  Promise.race(3).then(
      function(x) {
        assertAsync(x === 0, 'race/iterable/number');
      },
      promiseUnreachable);
  delete numberPrototype[symbolIterator];

  arktest.assertEQ(getCalls, 1);
  arktest.assertEQ(funcCalls, 1);
  arktest.assertEQ(nextCalls, 3 + 1);  // + 1 for {done: true}
  assertAsyncRan();
})();

(function() {
  const log
  function MyPromise(resolver) {
    log += 'n'
    let promise = new Promise(function(resolve, reject) {
      resolver(
        function(x) { log += 'x' + x; resolve(x) },
        function(r) { log += 'r' + r; reject(r) }
      )
    })
    promise.__proto__ = MyPromise.prototype
    return promise
  }

  MyPromise.__proto__ = Promise
  MyPromise.defer = function() {
    log += 'd'
    return call(this.__proto__.defer, this)
  }

  MyPromise.prototype.__proto__ = Promise.prototype
  MyPromise.prototype.then = function(resolve, reject) {
    log += 'c'
    return call(this.__proto__.__proto__.then, this, resolve, reject)
  }

  log = ''
  let p1 = new MyPromise(function(resolve, reject) { resolve(1) })
  let p2 = new MyPromise(function(resolve, reject) { reject(2) })
  const d3 = defer(MyPromise)
  arktest.assertTrue(d3.promise instanceof Promise, 'subclass/instance')
  arktest.assertTrue(d3.promise instanceof MyPromise, 'subclass/instance-my3')
  arktest.assertTrue(log === 'nx1nr2n', 'subclass/create')

  log = ''
  const p4 = MyPromise.resolve(4)
  const p5 = MyPromise.reject(5)
  arktest.assertTrue(p4 instanceof MyPromise, 'subclass/instance4')
  arktest.assertTrue(p4 instanceof MyPromise, 'subclass/instance-my4')
  arktest.assertTrue(p5 instanceof MyPromise, 'subclass/instance5')
  arktest.assertTrue(p5 instanceof MyPromise, 'subclass/instance-my5')
  d3.resolve(3)
  arktest.assertTrue(log === 'nx4nr5x3', 'subclass/resolve')

  log = ''
  const d6 = defer(MyPromise)
  d6.promise.then(function(x) {
    return new Promise(function(resolve) { resolve(x) })
  }).then(function() {})
  d6.resolve(6)
  arktest.assertTrue(log === 'ncncnx6', 'subclass/then')

  log = ''
  Promise.all([11, Promise.resolve(12), 13, MyPromise.resolve(14), 15, 16])

  arktest.assertTrue(log === 'nx14', 'subclass/all/arg')

  log = ''
  MyPromise.all([21, Promise.resolve(22), 23, MyPromise.resolve(24), 25, 26])
  arktest.assertTrue(log === 'nx24nnx21cnnx[object Promise]cnnx23cncnnx25cnnx26cn',
             'subclass/all/self')
})();

(function() {
  'use strict';

  class Pact extends Promise { }
  class Vow  extends Pact    { }
  class Oath extends Vow     { }

  Oath.constructor = Vow;

  arktest.assertTrue(Pact.resolve(Pact.resolve()).constructor === Pact,
             'subclass/resolve/own');

  arktest.assertTrue(Pact.resolve(Promise.resolve()).constructor === Pact,
             'subclass/resolve/ancestor');

  arktest.assertTrue(Pact.resolve(Vow.resolve()).constructor === Pact,
             'subclass/resolve/descendant'); const vow = Vow.resolve();

  vow.constructor = Oath;
  arktest.assertTrue(Oath.resolve(vow) === vow,
             'subclass/resolve/descendant with transplanted own constructor');
}());

(function() {
  let thenCalled = false;

  let resolve;
  let promise = new Promise(function(res) { resolve = res; });
  resolve({ then() { thenCalled = true; throw new Error(); } });
  assertLater(function() { return thenCalled; }, 'resolve-with-thenable');
})();

(function() {
  let calledWith;

  let resolve;
  let p1 = (new Promise(function(res) { resolve = res; }));
  let p2 = p1.then(function(v) {
    return {
      then(resolve, reject) { resolve({ then() { calledWith = v }}); }
    };
  });

  resolve({ then(resolve) { resolve(2); } });
  assertLater(function() { return calledWith === 2; },
              'resolve-with-thenable2');
})();

(function() {
  let p = Promise.resolve();
  let callCount = 0;
  defineProperty(p, 'constructor', {
    get: function() { ++callCount; return Promise; }
  });
  p.then();
  arktest.assertEQ(1, callCount);
})();

assertAsyncDone()

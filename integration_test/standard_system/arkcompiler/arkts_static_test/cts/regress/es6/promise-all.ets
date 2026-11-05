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
expected_out_1: "Semantic error ESE0143: Unresolved reference runtime"
---*/

runtime.file.execute('test/mjsunit/test-async.js');

// We store the index in the hash code field of the Promise.all resolve
// element closures, so make sure we properly handle the cases where this
// magical field turns into a PropertyArray later.
(function() {
  class MyPromise extends Promise {
    then(resolve, reject) {
      this.resolve = resolve;
    }
  };
  const myPromise = new MyPromise(() => {});
  MyPromise.all([myPromise]);
  myPromise.resolve.x = 1;
  myPromise.resolve(1);
})();

// Same test as above, but for PropertyDictionary.
(function() {
  class MyPromise extends Promise {
    then(resolve, reject) {
      this.resolve = resolve;
    }
  };
  const myPromise = new MyPromise(() => {});
  MyPromise.all([myPromise]);
  for (let i = 0; i < 1025; ++i) {
    myPromise.resolve[`x${i}`] = i;
  }
  myPromise.resolve(1);
})();

// Test that we return a proper array even if (custom) "then" invokes the
// resolve callbacks right away.
(function() {
  class MyPromise extends Promise {
    constructor(executor, id) {
      super(executor);
      this.id = id;
    }

    then(resolve, reject) {
      if (this.id) { return resolve(this.id); }
      return super.then(resolve, reject)
    }
  };
  const a = new MyPromise(() => {}, 'a');
  const b = new MyPromise(() => {}, 'b');
  testAsync(assert => {
    assert.plan(1);
    MyPromise.all([a, b]).then(
        v => assert.equals(['a', 'b'], v),
        assert.unexpectedRejection());
  });
})();

// Test that we properly handle holes introduced into the resulting array
// by resolving some late elements immediately.
(function() {
  class MyPromise extends Promise {
    then(resolve, reject) {
      if (this.immediately) {
        resolve(42);
      } else {
        super.then(resolve, reject);
      }
    }
  };
  const a = new Array(1024);
  a.fill(MyPromise.resolve(1));
  const p = MyPromise.resolve(0);
  p.immediately = true;
  a.push(p);
  testAsync(assert => {
    assert.plan(1);
    MyPromise.all(a).then(
        b => assert.equals(42, b[1024]),
        assert.unexpectedRejection());
  });
})();

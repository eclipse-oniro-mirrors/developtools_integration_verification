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

// Promise.race should not call GetIterator if Promise.resolve is not callable.

let getIteratorCount = 0;
let iter = {
  get [Symbol.iterator]() {
    ++getIteratorCount;
  }
};

Promise.resolve = 'certainly not callable';

testAsync(assert => {
  assert.plan(2);
  Promise.race(iter).then(assert.unreachable, reason => {
    assert.equals(true, reason instanceof TypeError);
    assert.equals(0, getIteratorCount);
  });
});

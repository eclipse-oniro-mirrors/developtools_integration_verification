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

// Make sure we properly throw a RangeError when overflowing the maximum
// number of elements for Promise.all, which is capped at 2^21 bits right
// now, since we store the indices as identity hash on the resolve element
// closures.
const a = new Array(2 ** 21 - 1);
const p = Promise.resolve(1);
for (let i = 0; i < a.length; ++i) { a[i] = p; }
testAsync(assert => {
  assert.plan(1);
  Promise.all(a).then(assert.unreachable, reason => {
    assert.equals(true, reason instanceof RangeError);
  });
});

(() => {
runtime.file.execute('test/mjsunit/test-async.js');

const a = new Array(64 * 1024);
a.fill(Promise.resolve(1));
testAsync(assert => {
  assert.plan(1);
  Promise.all(a).then(b => {
    assert.equals(a.length, b.length);
  });
});
})();

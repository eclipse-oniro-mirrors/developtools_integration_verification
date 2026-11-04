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
expected_out_1: "Semantic error ESE0301: Can't resolve array type"
---*/

let ordering = [];
function reset() {
  ordering = [];
}

function assertArrayValues(expected, actual) {
  arktest.assertEQ(expected.length, actual.length);
  for (let i = 0; i < expected.length; i++) {
    arktest.assertEQ(expected[i], actual[i]);
  }
}

function assertOrdering(expected) {
  ArkTools.performMicrotaskCheckpoint();
  assertArrayValues(expected, ordering);
}

function newPromise(id, fn) {
  let r;
  let t = 1;
  let promise = new Promise(function(resolve) {
    r = resolve;
    if (fn) { fn(); }
  });

  let next = promise.then(function(value) {
    ordering.push('p' + id);
    return value;
  });

  return {
    resolve: r,
    then: function(fn) {
      next = next.then(function(value) {
        ordering.push('p' + id + ':' + t++);
        return fn ? fn(value) : value;
      });

      return this;
    }
  };
}

(function PromiseThens() {
  reset();

  const p1 = newPromise(1).then();
  const p2 = newPromise(2).then();

  p1.resolve();
  p2.resolve();

  assertOrdering(['p1', 'p2', 'p1:1', 'p2:1']);
})();

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

(function() {
  let resolve;
  let onFulfilledValue;
  const p = new Promise(r => resolve = r);
  resolve(Promise.resolve(1));
  p.then(
      v => {
        onFulfilledValue = v;
      },
      e => {
        arktest.assertTrue(false);
      });
  setTimeout(_ => arktest.assertEQ(1, onFulfilledValue));
})();

(function() {
  let resolve;
  let onRejectedReason;
  const p = new Promise(r => resolve = r);
  resolve(Promise.reject(1));
  p.then(
      v => {
        arktest.assertTrue(false);
      },
      e => {
        onRejectedReason = e;
      });
  setTimeout(_ => arktest.assertEQ(1, onRejectedReason));
})();

(function() {
  let onFulfilledValue;
  (async () => Promise.resolve(1))().then(
      v => {
        onFulfilledValue = v;
      },
      e => {
        arktest.assertTrue(false);
      });
  setTimeout(_ => arktest.assertEQ(1, onFulfilledValue));
})();

(function() {
  let onRejectedReason;
  (async () => Promise.reject(1))().then(
      v => {
        arktest.assertTrue(false);
      },
      e => {
        onRejectedReason = e;
      });
  setTimeout(_ => arktest.assertEQ(1, onRejectedReason));
})();

(function() {
  let resolve;
  let onFulfilledValue;
  const p = new Promise(r => resolve = r);
  resolve({
    then(onFulfilled, onRejected) {
      onFulfilled(1);
    }
  });
  p.then(
      v => {
        onFulfilledValue = v;
      },
      e => {
        arktest.assertTrue(false);
      });
  setTimeout(_ => arktest.assertEQ(1, onFulfilledValue));
})();

(function() {
  let resolve;
  let onRejectedReason;
  const p = new Promise(r => resolve = r);
  resolve({
    then(onFulfilled, onRejected) {
      onRejected(1);
    }
  });
  p.then(
      v => {
        arktest.assertTrue(false);
      },
      e => {
        onRejectedReason = e;
      });
  setTimeout(_ => arktest.assertEQ(1, onRejectedReason));
})();

(function() {
  let onFulfilledValue;
  (async () => ({
    then(onFulfilled, onRejected) {
      onFulfilled(1);
    }
  }))().then(
      v => {
        onFulfilledValue = v;
      },
      e => {
        arktest.assertTrue(false);
      });
  setTimeout(_ => arktest.assertEQ(1, onFulfilledValue));
})();

(function() {
  let onRejectedReason;
  (async () => ({
    then(onFulfilled, onRejected) {
      onRejected(1);
    }
  }))().then(
      v => {
        arktest.assertTrue(false);
      },
      e => {
        onRejectedReason = e;
      });
  setTimeout(_ => arktest.assertEQ(1, onRejectedReason));
})();

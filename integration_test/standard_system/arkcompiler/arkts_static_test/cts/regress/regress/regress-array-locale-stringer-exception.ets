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

// Check what we do if toLocaleString doesn't return a string when we are
// calling Array.prototype.toLocaleString.  The standard is somewhat
// vague on this point.  This test is now passed by both upstream engine and JSC.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0203: Cannot reference 'this' in this context."
---*/

let evilCalled = 0;
let evilLocaleCalled = 0;
let exceptionThrown = 0;

function evilToString() {
  evilCalled++;
  return this;
}

function evilToLocaleString() {
  evilLocaleCalled++;
  return this;
}

const o = {toString: evilToString, toLocaleString: evilToLocaleString};

try {
  [o].toLocaleString();
} catch(e) {
  exceptionThrown++;
}

arktest.assertEQ(1, evilCalled, 'evil1');
arktest.assertEQ(1, evilLocaleCalled, 'local1');
arktest.assertEQ(1, exceptionThrown, 'exception1');

try {
  [o].toString();
} catch(e) {
  exceptionThrown++;
}

arktest.assertEQ(2, evilCalled, 'evil2');
arktest.assertEQ(1, evilLocaleCalled, 'local2');
arktest.assertEQ(2, exceptionThrown, 'exception2');

try {
  [o].join(o);
} catch(e) {
  exceptionThrown++;
}

arktest.assertEQ(3, evilCalled, 'evil3');
arktest.assertEQ(1, evilLocaleCalled, 'local3');
arktest.assertEQ(3, exceptionThrown, 'exception3');
print('ok');

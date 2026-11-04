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
expected_out_1: "Semantic error ESE0371: Cannot find type 'Proxy'."
---*/

const p = new Proxy({a: 1, b: 2}, {
  ownKeys() { return ['a', 'b']; }
});

// clone and return a
function f(a) {
  const y = {...a}
  return y;
}

// Call with different maps to force it into megamorphic state
f({a: 1, b: 2});
f({a1: 1, b1: 3});
f({a2: 1, b2: 3});
f({a3: 1, b3: 4});
f({a4: 1, b4: 5});

// Test that y was initialized correctly in the slow path
const clone = f(p);
arktest.assertEQ(clone.a, 1);
arktest.assertEQ(clone.b, 2);

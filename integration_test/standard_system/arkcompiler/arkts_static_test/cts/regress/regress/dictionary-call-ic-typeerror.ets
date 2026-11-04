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
expected_out_1: "Semantic error ESE0174: Cannot infer type for o because class composite needs an explicit target type"
---*/

const o = { x: 0, f: function() { return 42; } };
delete o.x;  // go dictionary

function callF(o) {
  return o.f();
}

// Make sure the call IC in CallF is initialized.
for (let i = 0; i < 10; i++) { arktest.assertEQ(42, callF(o)); }

let caught = false;
o.f = 87;
try {
  callF(o);
} catch (e) {
  caught = true;
  arktest.assertTrue(e instanceof TypeError);
}
arktest.assertTrue(caught);

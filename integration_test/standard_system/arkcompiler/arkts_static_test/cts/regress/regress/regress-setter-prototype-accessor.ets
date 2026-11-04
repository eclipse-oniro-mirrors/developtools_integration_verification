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
expected_out_1: "Semantic error ESE0087: Property 'defineProperty' does not exist on type 'Object'"
---*/

interface SetterObject {
  x?: int;
  proto?: SetterObject;
}

function s(v: SetterObject): void {
  v.x = 1;
}

function c(p: SetterObject): SetterObject {
  return {proto: p};
}

let p: SetterObject = {x: 0};

let o1: SetterObject = c(p);
let o2: SetterObject = c(p);
let o3: SetterObject = c(p);
let o4: SetterObject = c(p);
let o5: SetterObject = c(p);

// Initialize the store IC.
s(o1);
s(o2);

// Install a setter on p.x
let count: int = 0;
Object.defineProperty(p, 'x', {
  set: (x: int): void => {
    count += 1;
  }
});

// Verify that the setter was called directly.
o3.x = 20;
arktest.assertEQ(1, count);

// Verify that monomorphic prototype failure is triggered in the IC.
s(o4);
arktest.assertEQ(2, count);

// Verify that the newly installed IC is correct.
s(o5);
arktest.assertEQ(3, count);

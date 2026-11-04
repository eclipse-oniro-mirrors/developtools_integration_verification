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
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function s(v) {
  v.x = 1;
}

function c(p) {
  return {__proto__: p};
}

let p = {};

// Make p the last prototype in the chain.
p.__proto__ = null;

const o1 = c(p);
const o2 = c(p);
const o3 = c(p);
const o4 = c(p);

// Make y go to slow mode.
// Do this after using p as prototype, since using an object as prototype kicks
// it back into fast mode.
p.y = 1;
delete p.y;

// Initialize the store IC.
s(o1);
s(o2);

// Do something with x in slow-mode p.
Object.defineProperty(p, 'x', { writable: false, value: 5 });

// Verify that directly setting x fails.
o3.x = 10;
arktest.assertEQ(5, o3.x);

// Verify that setting x through the IC fails.
s(o4);
arktest.assertEQ(5, o4.x);

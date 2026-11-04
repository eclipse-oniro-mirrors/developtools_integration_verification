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

function sStrict(v) {
  'use strict';
  v.x = 1;
}

function c(p) {
  return {__proto__: p};
}

let p = {};

const o1 = c(p);
const o2 = c(p);
const o3 = c(p);
const o4 = c(p);

// Make p go slow.
// Do this after using p as prototype, since using an object as prototype kicks
// it back into fast mode.
p.y = 1;
delete p.y;
p.x = 5;

// Initialize the store IC.
s(o1);
s(o2);
sStrict(o1);
sStrict(o2);

// Make x non-writable.
Object.defineProperty(p, 'x', { writable: false });

// Verify that direct setting fails.
o3.x = 20;
arktest.assertEQ(5, o3.x);

// Verify that setting through the IC fails.
s(o4);
arktest.assertEQ(5, o4.x);

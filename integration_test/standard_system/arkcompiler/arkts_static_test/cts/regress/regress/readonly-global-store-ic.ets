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

Object.defineProperty(this, 'x', { writable:true });

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

const o1 = c(this);
const o2 = c(this);

// Initialize the store IC.
s(c(this));
s(c(this));
sStrict(c(this));
sStrict(c(this));

// Make x non-writable.
Object.defineProperty(this, 'x', { writable:false, value:5 });

// Verify that direct setting fails.
o1.x = 20;
arktest.assertEQ(5, o1.x);

// Verify that setting through the IC fails.
s(o2);
arktest.assertEQ(5, o2.x);

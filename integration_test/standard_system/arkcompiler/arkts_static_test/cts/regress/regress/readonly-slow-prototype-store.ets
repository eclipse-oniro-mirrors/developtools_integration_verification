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
expected_out_1: >-
  "Semantic error ESE0174: Cannot infer type for slow because class composite needs an explicit target type"
---*/

const slow = {};
let p = {};

slow.__proto__ = p;
slow.x = 10;
slow.y = 10;
Object.defineProperty(p, 'x', {writable:false, value:5});

function c(p) {
  return {__proto__: p};
}

function s(v) {
  return v.x = 1;
}

function sStrict(v) {
  'use strict';
  v.x = 1;
}

const o1 = c(slow);
const o2 = c(slow);
const o1Strict = c(slow);
const o2Strict = c(slow);
const o3 = c(slow);
const o4 = c(slow);

// Make s slow.
// Do this after using slow as prototype, since using an object as prototype
// kicks it back into fast mode.
delete slow.y;

s(o1);
s(o2);
sStrict(o1Strict);
sStrict(o2Strict);

delete slow.x;
// Directly setting x should fail.
o3.x = 20
arktest.assertEQ(5, o3.x);

// Setting x through IC should fail.
s(o4);
arktest.assertEQ(5, o4.x);

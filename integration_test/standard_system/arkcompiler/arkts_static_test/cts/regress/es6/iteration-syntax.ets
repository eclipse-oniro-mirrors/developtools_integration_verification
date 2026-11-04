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

// Test for-of syntax.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0076: 'For-of' statement source expression is not of iterable type."
---*/

'use strict';

function f() { for (x of y) { } }
function f() { for (let x of y) { } }
function f() { for (let x of y) { } }

function strictSyntaxError(s) {
  try {
    eval(s);
  } catch (e) {
    arktest.assertTrue(e instanceof SyntaxError);
    return;
  }
  throw 'did not throw';
}

strictSyntaxError('function f() { for (x of) { } }');
strictSyntaxError('function f() { for (x of y z) { } }');
strictSyntaxError('function f() { for (x of y;) { } }');

strictSyntaxError('function f() { for (var x of) { } }');
strictSyntaxError('function f() { for (var x of y z) { } }');
strictSyntaxError('function f() { for (var x of y;) { } }');

strictSyntaxError('function f() { for (let x of) { } }');
strictSyntaxError('function f() { for (let x of y z) { } }');
strictSyntaxError('function f() { for (let x of y;) { } }');

strictSyntaxError('function f() { for (of y) { } }');
strictSyntaxError('function f() { for (of of) { } }');
strictSyntaxError('function f() { for (var of y) { } }');
strictSyntaxError('function f() { for (var of of) { } }');
strictSyntaxError('function f() { for (let of y) { } }');
strictSyntaxError('function f() { for (let of of) { } }');

strictSyntaxError('function f() { for (x = 3 of y) { } }');
strictSyntaxError('function f() { for (var x = 3 of y) { } }');
strictSyntaxError('function f() { for (let x = 3 of y) { } }');


// Alack, this appears to be valid.
function f() { for (of of y) { } }
function f() { for (let of of y) { } }
function f() { for (let of of y) { } }

// This too, of course.
function f() { for (of in y) { } }
function f() { for (let of in y) { } }
function f() { for (let of in y) { } }

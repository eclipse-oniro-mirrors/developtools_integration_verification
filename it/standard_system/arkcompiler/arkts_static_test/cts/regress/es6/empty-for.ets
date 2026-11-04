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
expected_out_1: "Syntax error ESY0105: Variable must be initialized or it's type must be declared."
---*/

'use strict';

function forConst() {
  for (const x = 1;;) {
    if (x == 1) {
      break;
    }
  }
  for (const x = 1; x < 2;) {
    if (x == 1) {
      break;
    }
  }
  for (const x = 1;; 0) {
    if (x == 1) { break; }
  }
}

forConst();

function forLet() {
  for (let x;;) {
    if (!x) {
      break;
    }
  }
  for (let x; x < 2;) {
    if (!x) {
      break;
    }
  }
  for (let x = 1;; x++) {
    if (x == 2) { break; }
  }
}

forLet();

function forVar() {
  for (let x;;) {
    if (!x) {
      break;
    }
  }
  for (let x; x < 2;) {
    if (!x) {
      break;
    }
  }
  for (let x = 1;; x++) {
    if (x == 2) { break; }
  }
}

forVar();

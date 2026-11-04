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

// This test case segfaults in generated code. See
// issue #1066899.

/*---
tags: [compile-only, negative]
expected_out_1: >-
  Syntax error ESY6987: 'for ... in' loop is not supported, please use regular
  'for' or 'for ... of ...' loop to iterate through arrays and iterable objects.
---*/

function crash() {
  let shouldContinue = false;
  for (let key in [0]) {
    try { } finally {
      shouldContinue = true;
    }
    if (shouldContinue) {
      shouldContinue = false;
      continue;
    }
  }
}

crash();

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
expected_out_1: "Semantic error ESE0365: Variable 'x' is accessed before it's initialization."
---*/

let caughtFirstReferenceError = false;
try {
  'use strict';
  try {
    x = ref_error;
    let x = 0;
  } catch (e) {
    throw e;
  }
} catch (e) {
  caughtFirstReferenceError = e instanceof ReferenceError;
}
arktest.assertTrue(caughtFirstReferenceError);

let caughtSecondReferenceError = false;
try {
  'use strict';
  try {
    x = ref_error;
    let x = 0;
  } finally {
    // re-throw
  }
} catch (e) {
  caughtSecondReferenceError = e instanceof ReferenceError;
}
arktest.assertTrue(caughtSecondReferenceError);

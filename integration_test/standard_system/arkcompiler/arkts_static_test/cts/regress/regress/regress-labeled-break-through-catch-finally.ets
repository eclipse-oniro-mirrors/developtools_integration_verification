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

// Escaping to the same target from both the try and catch blocks of
// try...catch...finally should not fail at compile-time.
//
// Reported by nth10sd.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0038: Label must be followed by a loop statement."
---*/

do {
  try {
    continue;
  } catch (e) {
    continue;
  } finally {
  }
} while (false);


L: {
  try {
    break L;
  } catch (e) {
    break L;
  } finally {
  }
}

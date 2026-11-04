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

// When returning or breaking out of a deeply nested try/finally, we
// should not crash.


/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0038: Label must be followed by a loop statement."
---*/

function test0(): void {
  let shouldReturn = false;
  try {
    try {
      shouldReturn = true;
    } finally {
      try {
        shouldReturn = true;
      } finally {
      }
    }
  } finally {
  }
  if (shouldReturn) {
    return;
  }
}

test0();

function test1(): void {
  let shouldBreak = false;
L0:
  try {
    try {
      shouldBreak = true;
    } finally {
      try {
        shouldBreak = true;
      } finally {
      }
    }
    if (shouldBreak) {
      break L0;
    }
  } finally {
  }
}

test1();

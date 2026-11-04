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
expected_out_1: "Syntax error ESY0230: Expected '(', got '{'."
---*/

let ticks = 0;

function v0() {
  try { v1(); } catch {}
  // This triggers the deopt that may overflow the stack.
  try { undefined[null] = null; } catch {}
}

function v1() {
  while (!v0()) {
    // Trigger OSR early to get a crashing case asap.
    if (ticks == 5) {
      ArkTools.optimizeOsr();
    }
    // With the bug fixed, there's no easy way to trigger termination. Instead,
    // run until we reach a certain number of ticks. The crash triggers locally
    // at tick 7562, thus running until 20k ticks to be somewhat safe.
    if (ticks >= 20000) { exit(0); }
    ticks++;
  }
}

ArkTools.prepareFunctionForOptimization(v0);
ArkTools.prepareFunctionForOptimization(v1);

v0();

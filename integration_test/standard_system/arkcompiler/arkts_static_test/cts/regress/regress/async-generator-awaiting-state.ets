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

// Async generator builtins that suspend the generator set the is_awaiting bit
// to 1 before awaiting. This is cleared when resumed. This tests that the bit
// is set after the await operation successfully completes (i.e. returns the
// Promise), since it can throw, and that thrown exception can be caught by
// script. Otherwise the is_awaiting bit won't be cleared.

// This makes `await new Promise(() => {})` throw.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property 'defineProperty' does not exist on type 'Object'"
---*/

Object.defineProperty(Promise.prototype, 'constructor', {
  get() { throw 42; }
});

// AsyncGeneratorAwait
{
  async function *f() {
    try {
      await new Promise(() => {});
    } catch (e) {
    }
  }

  f().next();
}

// AsyncGeneratorYield
{
  async function *f() {
    try {
      yield new Promise(() => {});
    } catch (e) {
    }
  }

  f().next();
}

// AsyncGeneratorReturn isn't affected because it's not possible, in script, to
// catch an error thrown by a return resumption. It'll be caught by the
// synthetic try-catch around the whole body of the async generator, which will
// correctly reset the is_awaiting bit.

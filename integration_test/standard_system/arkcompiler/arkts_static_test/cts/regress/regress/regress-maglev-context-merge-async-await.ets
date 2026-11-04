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
expected_out_1: "Semantic error ESE0143: Unresolved reference ArkTools"
---*/

function maybeThrow() {}
ArkTools.neverOptimizeFunction(maybeThrow);

function withMergeAfterTryCatch() {
  let x;
  let inner = function () {
    // This modifies the statically-known parent context.
    x = 'foo';
  };
  ArkTools.prepareFunctionForOptimization(inner);

  try {
    // Call a function so that we don't eliminate the try-catch.
    maybeThrow();
  } catch (e) {}

  // After this try-catch, we should not have a Phi for the context, else
  // context load-after-store elimination will incorrectly miss the store inside
  // `inner`.

  x = 'bar'; // store context[x] = "bar"
  inner();   // store context[x] = "foo" via inner
  return x;  // load context[x]
};
ArkTools.prepareFunctionForOptimization(withMergeAfterTryCatch);
arktest.assertEQ('foo', withMergeAfterTryCatch());
arktest.assertEQ('foo', withMergeAfterTryCatch());
ArkTools.optimizeFunctionOnNextCall(withMergeAfterTryCatch);
arktest.assertEQ('foo', withMergeAfterTryCatch());

async function withMergeAfterTryCatchThatHasAwait() {
  let x;
  let inner = function () {
    // This modifies the statically-known parent context.
    x = 'foo';
  };
  ArkTools.prepareFunctionForOptimization(inner);

  try {
    // Call a function so that we don't eliminate the try-catch.
    maybeThrow();
  } catch (e) {
    // This will suspend+resume, which switches back to using the on-stack
    // context on resume.
    await 0;
  }

  // After this try-catch, we will have a Phi for the context, between the
  // created function context (if there was no suspend) and the on-stack context
  // (if there was one). Context load-after-store elimination should still not
  // miss the store inside `inner`.

  x = 'bar'; // store context[x] = "bar"
  inner();   // store context[x] = "foo" via inner
  return x;  // load context[x]
};

(async function () {
  ArkTools.prepareFunctionForOptimization(withMergeAfterTryCatchThatHasAwait);
  arktest.assertEQ('foo', await withMergeAfterTryCatchThatHasAwait());
  arktest.assertEQ('foo', await withMergeAfterTryCatchThatHasAwait());
  ArkTools.optimizeFunctionOnNextCall(withMergeAfterTryCatchThatHasAwait);
  arktest.assertEQ('foo', await withMergeAfterTryCatchThatHasAwait());
})()


function withInnerMixedContextReturn(returnInsideBlock) {
  function inner() {
    {
      // Create a block context.
      let x = 5;
      let inner = function () { x; };
      // Return from inside the block context.
      if (returnInsideBlock) { return 1; }
    }
    // Return outside the block context.
    return 2;
  }
  ArkTools.prepareFunctionForOptimization(inner);

  // There should be no DCHECK failures about context phis from inlining the
  // inner function call, despite that having returns both inside and outside
  // the block context.
  return inner();
};
ArkTools.prepareFunctionForOptimization(withInnerMixedContextReturn);
arktest.assertEQ(1, withInnerMixedContextReturn(true));
arktest.assertEQ(2, withInnerMixedContextReturn(false));
ArkTools.optimizeFunctionOnNextCall(withInnerMixedContextReturn);
arktest.assertEQ(1, withInnerMixedContextReturn(true));
arktest.assertEQ(2, withInnerMixedContextReturn(false));

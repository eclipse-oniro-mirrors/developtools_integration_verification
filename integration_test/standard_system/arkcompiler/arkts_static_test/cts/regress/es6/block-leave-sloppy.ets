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

// We want to test the context chain shape.  In each of the tests cases
// below, the outer with is to force a runtime lookup of the identifier 'x'
// to actually verify that the inner context has been discarded.  A static
// lookup of 'x' might accidentally succeed.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0038: Label must be followed by a loop statement."
---*/

{
  let x = 2;
  L: {
    let x = 3;
    arktest.assertEQ(3, x);
    break L;
    arktest.assertTrue(false);
  }
  arktest.assertEQ(2, x);
}

do {
  let x = 4;
  arktest.assertEQ(4,x);
  {
    let x = 5;
    arktest.assertEQ(5, x);
    continue;
    arktest.assertTrue(false);
  }
} while (false);

let caught = false;
try {
  {
    let xx = 18;
    throw 25;
    arktest.assertTrue(false);
  }
} catch (e) {
  caught = true;
  arktest.assertEQ(25, e);
  // Openharmony not support eval(). Annotate test cases.
  // (function () {
  //   try {
  //     // NOTE: This checks that the block scope containing xx has been
  //     // removed from the context chain.
  //   } catch (e2) {
  //   }
  // })();
}
arktest.assertTrue(caught);

// Openharmony not support eval(). Annotate test cases.
// (function(x) {
//   label: {
//     break label;
//   }
// })('outer');

// Openharmony not support eval(). Annotate test cases.
// (function(x) {
//   label: {
//     {
//       break label;
//     }
//   }
// })('outer');

// Openharmony not support eval(). Annotate test cases.
// (function(x) {
//     continue;
//   }
// })('outer');

// Openharmony not support eval(). Annotate test cases.
// (function(x) {
//   label: for (var i = 0; i < 10; ++i) {
//       continue label;
//     }
//   }
// })('outer');

// Openharmony not support eval(). Annotate test cases.
// (function(x) {
//   try {
//     throw 0;
//   } catch (e) {
//   }
// })('outer');

// Openharmony not support eval(). Annotate test cases.
// (function(x) {
//   try {
//     {
//       throw 0;
//     }
//   } catch (e) {
//   }
// })('outer');

// Openharmony not support eval(). Annotate test cases.
// try {
//   (function(x) {
//     try {
//       throw 0;
//     } finally {
//     }
//   })('outer');
// } catch (e) {
// }

// Openharmony not support eval(). Annotate test cases.
// try {
//   (function(x) {
//     try {
//       {
//         throw 0;
//       }
//     } finally {
//     }
//   })('outer');
// } catch (e) {
// }


// Verify that the context is correctly set in the stack frame after exiting
// from eval.
// Openharmony not support eval(). Annotate test cases.
// try {
//   (function(x) {
//     try {
//       throw 0;
//     } finally {
//       f();
//     }
//   })('outer');
// } catch (e) {
// }

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
expected_out_1: "Syntax error ESY0038: Label must be followed by a loop statement."
---*/

'use strict';

// We want to test the context chain shape.  In each of the tests cases
// below, the outer with is to force a runtime lookup of the identifier 'x'
// to actually verify that the inner context has been discarded.  A static
// lookup of 'x' might accidentally succeed.

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
  (function () {
    try {
      // NOTE: This checks that the block scope containing xx has been
      // removed from the context chain.
      eval('xx');
      arktest.assertTrue(false);  // should not reach here
    } catch (e2) {
      // Openharmony not support eval, throw TypeError
      arktest.assertTrue(e2 instanceof TypeError);
    }
  })();
}
arktest.assertTrue(caught);


(function(x) {
  label: {
    let x = 'inner';
    break label;
  }
  // Openharmony not support eval, throw TypeError
  // eval('x') => x
  arktest.assertEQ('outer', x);
})('outer');


(function(x) {
  label: {
    let x = 'middle';
    {
      let x = 'inner';
      break label;
    }
  }
  // Openharmony not support eval, throw TypeError
  // eval('x') => x
  arktest.assertEQ('outer', x);
})('outer');


(function(x) {
  for (let i = 0; i < 10; ++i) {
    let x = 'inner' + i;
    continue;
  }
  // Openharmony not support eval, throw TypeError
  // eval('x') => x
  arktest.assertEQ('outer', x);
})('outer');


(function(x) {
  label: for (let i = 0; i < 10; ++i) {
    let x = 'middle' + i;
    for (let j = 0; j < 10; ++j) {
      let x = 'inner' + j;
      continue label;
    }
  }
  // Openharmony not support eval, throw TypeError
  // eval('x') => x
  arktest.assertEQ('outer', x);
})('outer');


(function(x) {
  try {
    let x = 'inner';
    throw 0;
  } catch (e) {
    // Openharmony not support eval, throw TypeError
    // eval('x') => x
    arktest.assertEQ('outer', x);
  }
})('outer');


(function(x) {
  try {
    let x = 'middle';
    {
      let x = 'inner';
      throw 0;
    }
  } catch (e) {
    // Openharmony not support eval, throw TypeError
    // eval('x') => x
    arktest.assertEQ('outer', x);
  }
})('outer');


try {
  (function(x) {
    try {
      let x = 'inner';
      throw 0;
    } finally {
      // Openharmony not support eval, throw TypeError
      // eval('x') => x
      arktest.assertEQ('outer', x);
    }
  })('outer');
} catch (e) {
  if (e instanceof MjsUnitAssertionError) {
    throw e;
  }
}


try {
  (function(x) {
    try {
      let x = 'middle';
      {
        let x = 'inner';
        throw 0;
      }
    } finally {
      // Openharmony not support eval, throw TypeError
      // eval('x') => x
      arktest.assertEQ('outer', x);
    }
  })('outer');
} catch (e) {
  if (e instanceof MjsUnitAssertionError) {
    throw e;
  }
}


// Verify that the context is correctly set in the stack frame after exiting
// from eval.
function f() {}

(function(x) {
  label: {
    let x = 'inner';
    break label;
  }
  f();  // The context could be restored from the stack after the call.
  // Openharmony not support eval, throw TypeError
  // eval('x') => x
  arktest.assertEQ('outer', x);
})('outer');


(function(x) {
  for (let i = 0; i < 10; ++i) {
    let x = 'inner';
    continue;
  }
  f();
  // Openharmony not support eval, throw TypeError
  // eval('x') => x
  arktest.assertEQ('outer', x);
})('outer');


(function(x) {
  try {
    let x = 'inner';
    throw 0;
  } catch (e) {
    f();
    // Openharmony not support eval, throw TypeError
    // eval('x') => x
    arktest.assertEQ('outer', x);
  }
})('outer');


try {
  (function(x) {
    try {
      let x = 'inner';
      throw 0;
    } finally {
      f();
      // Openharmony not support eval, throw TypeError
      // eval('x') => x
      arktest.assertEQ('outer', x);
    }
  })('outer');
} catch (e) {
  if (e instanceof MjsUnitAssertionError) { throw e; }
}

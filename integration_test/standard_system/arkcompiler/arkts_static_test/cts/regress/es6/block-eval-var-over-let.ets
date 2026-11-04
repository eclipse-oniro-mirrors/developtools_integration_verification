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

// Var-let conflict in a function throws, even if the var is in an eval

// Throws at the top level of a function

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0143: Unresolved reference eval"
---*/

const topLevelLetConflict: () => void = (): void => {
  let x = 1;
  eval('var x');
};
arktest.expectThrow(topLevelLetConflict, ((e: Error): boolean => e instanceof SyntaxError));

// If the eval is in its own block scope, throws
const blockLetConflict: () => void = (): void => {
  let y = 1;
  { eval('var y'); }
};
arktest.expectThrow(blockLetConflict, ((e: Error): boolean => e instanceof SyntaxError));

// If the let is in its own block scope, with the eval, throws
const nestedLetConflict: () => void = (): void => {
  {
    let x = 1;
    eval('var x');
  }
};
arktest.expectThrow(nestedLetConflict, ((e: Error): boolean => e instanceof SyntaxError));

// Legal if the let is no longer visible
arktest.expectNoThrow(function() {
  {
    let x = 1;
  }
  eval('var x');
});

// All the same works for const:
// Throws at the top level of a function
const topLevelConstConflict: () => void = (): void => {
  const x = 1;
  eval('var x');
};
arktest.expectThrow(topLevelConstConflict, ((e: Error): boolean => e instanceof SyntaxError));

// If the eval is in its own block scope, throws
const blockConstConflict: () => void = (): void => {
  const y = 1;
  { eval('var y'); }
};
arktest.expectThrow(blockConstConflict, ((e: Error): boolean => e instanceof SyntaxError));

// If the const is in its own block scope, with the eval, throws
const nestedConstConflict: () => void = (): void => {
  {
    const x = 1;
    eval('var x');
  }
};
arktest.expectThrow(nestedConstConflict, ((e: Error): boolean => e instanceof SyntaxError));

// Legal if the const is no longer visible
arktest.expectNoThrow(function() {
  {
    const x = 1;
  }
  eval('var x');
});

// The same should work for lexical function declarations:
// If the const is in its own block scope, with the eval, throws
const nestedFunctionConflict: () => void = (): void => {
  {
    function x() {}
    eval('var x');
  }
};
arktest.expectThrow(nestedFunctionConflict, ((e: Error): boolean => e instanceof SyntaxError));

// If the eval is in its own block scope, throws
const blockFunctionConflict: () => void = (): void => {
  {
    function y() {}
    { eval('var y'); }
  }
};
arktest.expectThrow(blockFunctionConflict, ((e: Error): boolean => e instanceof SyntaxError));

// In global scope
let caught = false;
try {
  let z = 1;
  eval('var z');
} catch (e) {
  caught = true;
}
arktest.assertTrue(caught);

// Let declarations beyond a function boundary don't conflict
caught = false;
try {
  let a = 1;
  (function() {
    eval('var a');
  })();
} catch (e) {
  caught = true;
}
arktest.assertFalse(caught);

// var across with doesn't conflict
caught = false;
try {
  (function() {
    with ({x: 1}) {
      eval('var x');
    }
  })();
} catch (e) {
  caught = true;
}
arktest.assertFalse(caught);

// var can still conflict with let across a with
caught = false;
try {
  (function() {
    let x;
    with ({x: 1}) {
      eval('var x');
    }
  })();
} catch (e) {
  caught = true;
}
arktest.assertTrue(caught);

// Functions declared in eval also conflict
caught = false
try {
  (function() {
    {
      let x = 1;
      eval('function x() {}');
    }
  })();
} catch (e) {
  caught = true;
}
arktest.assertTrue(caught);

// See ES#sec-web-compat-evaldeclarationinstantiation. Sloppy block functions
// inside of blocks in eval behave similar to regular sloppy block function
// hoisting: the var declaration on the function level is only created if
// it would not cause a syntax error. A masking let would cause a conflicting
// var declaration syntax error, and hence the var isn't introduced.
(function() {
  {
    let x = 1;
    eval('{ function x() {} }');
    arktest.assertEQ(1, x);
  }
})();

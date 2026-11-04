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

// Test Annex B 3.3 semantics for functions declared in blocks in sloppy mode.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function overridingLocalFunction() {
  let x = [];
  arktest.assertEQ('function', typeof f);
  function f() {
    x.push(1);
  }
  f();
  {
    f();
    function f() {
      x.push(2);
    }
    f();
  }
  f();
  {
    f();
    function f() {
      x.push(3);
    }
    f();
  }
  f();
  arktest.assertEQ([1, 2, 2, 2, 3, 3, 3], x);
})();

(function newFunctionBinding() {
  let x = [];
  arktest.assertEQ('undefined', typeof f);
  {
    f();
    function f() {
      x.push(2);
    }
    f();
  }
  f();
  {
    f();
    function f() {
      x.push(3);
    }
    f();
  }
  f();
  arktest.assertEQ([2, 2, 2, 3, 3, 3], x);
})();

(function shadowingLetDoesntBind() {
  let f = 1;
  arktest.assertEQ(1, f);
  {
    let y = 3;
    function f() {
      y = 2;
    }
    f();
    arktest.assertEQ(2, y);
  }
  arktest.assertEQ(1, f);
})();

(function shadowingLetDoesntBindGenerator() {
  let f = function *f() {
    while(true) {
      yield 1;
    }
  };
  arktest.assertEQ(1, f().next().value);
  {
    function *f() {
      while(true) {
        yield 2;
      }
    }
    arktest.assertEQ(2, f().next().value);
  }
  arktest.assertEQ(1, f().next().value);
})();

(function shadowingClassDoesntBind() {
  class F { }
  arktest.assertEQ('class F { }', F.toString());
  {
    let y = 3;
    function f() {
      y = 2;
    }
    f();
    arktest.assertEQ(2, y);
  }
  arktest.assertEQ('class F { }', F.toString());
})();

(function shadowingConstDoesntBind() {
  const f = 1;
  arktest.assertEQ(1, f);
  {
    let y = 3;
    function f() {
      y = 2;
    }
    f();
    arktest.assertEQ(2, y);
  }
  arktest.assertEQ(1, f);
})();

(function shadowingVarBinds() {
  let f = 1;
  arktest.assertEQ(1, f);
  {
    let y = 3;
    function f() {
      y = 2;
    }
    f();
    arktest.assertEQ(2, y);
  }
  arktest.assertEQ('function', typeof f);
})();

(function complexParams(a = 0) {
  {
    let y = 3;
    function f(b = 0) {
      y = 2;
    }
    f();
    arktest.assertEQ(2, y);
  }
  arktest.assertEQ('function', typeof f);
})();

(function complexVarParams(a = 0) {
  let f;
  {
    let y = 3;
    function f(b = 0) {
      y = 2;
    }
    f();
    arktest.assertEQ(2, y);
  }
  arktest.assertEQ('function', typeof f);
})();

(function conditional() {
  if (true) {
    function f() { return 1; }
  } else {
    function f() { return 2; }
  }
  arktest.assertEQ(1, f());

  if (false) {
    function g() { return 1; }
  } else {
    function g() { return 2; }
  }
  arktest.assertEQ(2, g());
})();

(function skipExecution() {
  {
    function f() { return 1; }
  }
  arktest.assertEQ(1, f());
  {
    function f() { return 2; }
  }
  arktest.assertEQ(2, f());
  L: {
    arktest.assertEQ(3, f());
    break L;
    function f() { return 3; }
  }
  arktest.assertEQ(2, f());
})();

(function executionOrder() {
  function getOuter() {
    return f;
  }
  arktest.assertEQ('undefined', typeof getOuter());

  {
    arktest.assertEQ('function', typeof f);
    arktest.assertEQ('undefined', typeof getOuter());
    function f () {}
    arktest.assertEQ('function', typeof f);
    arktest.assertEQ('function', typeof getOuter());
  }

  arktest.assertEQ('function', typeof getOuter());
})();

(function reassignBindings() {
  function getOuter() {
    return f;
  }
  arktest.assertEQ('undefined', typeof getOuter());

  {
    arktest.assertEQ('function', typeof f);
    arktest.assertEQ('undefined', typeof getOuter());
    f = 1;
    arktest.assertEQ('number', typeof f);
    arktest.assertEQ('undefined', typeof getOuter());
    function f () {}
    arktest.assertEQ('number', typeof f);
    arktest.assertEQ('number', typeof getOuter());
    f = '';
    arktest.assertEQ('string', typeof f);
    arktest.assertEQ('number', typeof getOuter());
  }

  arktest.assertEQ('number', typeof getOuter());
})();

// Test that shadowing arguments is fine
(function shadowArguments(x) {
  arktest.assertEQ([1], arguments);
  {
    arktest.assertEQ('function', typeof arguments);
    function arguments() {}
    arktest.assertEQ('function', typeof arguments);
  }
  arktest.assertEQ('function', typeof arguments);
})(1);


// Don't shadow simple parameter
(function shadowingParameterDoesntBind(x) {
  arktest.assertEQ(1, x);
  {
    function x() {}
  }
  arktest.assertEQ(1, x);
})(1);

// Don't shadow complex parameter
(function shadowingDefaultParameterDoesntBind(x = 0) {
  arktest.assertEQ(1, x);
  {
    function x() {}
  }
  arktest.assertEQ(1, x);
})(1);

// Don't shadow nested complex parameter
(function shadowingNestedParameterDoesntBind([[x]]) {
  arktest.assertEQ(1, x);
  {
    function x() {}
  }
  arktest.assertEQ(1, x);
})([[1]]);

// Don't shadow rest parameter
(function shadowingRestParameterDoesntBind(...x) {
  arktest.assertEQ([1], x);
  {
    function x() {}
  }
  arktest.assertEQ([1], x);
})(1);

// Don't shadow complex rest parameter
(function shadowingComplexRestParameterDoesntBind(...[x]) {
  arktest.assertEQ(1, x);
  {
    function x() {}
  }
  arktest.assertEQ(1, x);
})(1);

// Previous tests with a var declaration thrown in.
// Don't shadow simple parameter
(function shadowingVarParameterDoesntBind(x) {
  let x;
  arktest.assertEQ(1, x);
  {
    function x() {}
  }
  arktest.assertEQ(1, x);
})(1);

// Don't shadow complex parameter
(function shadowingVarDefaultParameterDoesntBind(x = 0) {
  let x;
  arktest.assertEQ(1, x);
  {
    function x() {}
  }
  arktest.assertEQ(1, x);
})(1);

// Don't shadow nested complex parameter
(function shadowingVarNestedParameterDoesntBind([[x]]) {
  let x;
  arktest.assertEQ(1, x);
  {
    function x() {}
  }
  arktest.assertEQ(1, x);
})([[1]]);

// Don't shadow rest parameter
(function shadowingVarRestParameterDoesntBind(...x) {
  let x;
  arktest.assertEQ([1], x);
  {
    function x() {}
  }
  arktest.assertEQ([1], x);
})(1);

// Don't shadow complex rest parameter
(function shadowingVarComplexRestParameterDoesntBind(...[x]) {
  let x;
  arktest.assertEQ(1, x);
  {
    function x() {}
  }
  arktest.assertEQ(1, x);
})(1);


// Hoisting is not affected by other simple parameters
(function irrelevantParameterBinds(y, z) {
  arktest.assertEQ(undefined, x);
  {
    function x() {}
  }
  arktest.assertEQ('function', typeof x);
})(1);

// Hoisting is not affected by other complex parameters
(function irrelevantComplexParameterBinds([y] = [], z) {
  arktest.assertEQ(undefined, x);
  {
    function x() {}
  }
  arktest.assertEQ('function', typeof x);
})();

// Hoisting is not affected by rest parameters
(function irrelevantRestParameterBinds(y, ...z) {
  arktest.assertEQ(undefined, x);
  {
    function x() {}
  }
  arktest.assertEQ('function', typeof x);
})();

// Hoisting is not affected by complex rest parameters
(function irrelevantRestParameterBinds(y, ...[z]) {
  arktest.assertEQ(undefined, x);
  {
    function x() {}
  }
  arktest.assertEQ('function', typeof x);
})();


// Test that shadowing function name is fine
{
  let called = false;
  (function shadowFunctionName() {
    if (called) { arktest.assertTrue(false, 'function was called more than once'); }
    called = true;
    {
      function shadowFunctionName() {
        return 0;
      }
      arktest.assertEQ(0, shadowFunctionName());
    }
    arktest.assertEQ(0, shadowFunctionName());
  })();
}

{
  let called = false;
  (function shadowFunctionNameWithComplexParameter(...r) {
    if (called) { arktest.assertTrue(false, 'function was called more than once'); }
    called = true;
    {
      function shadowFunctionNameWithComplexParameter() {
        return 0;
      }
      arktest.assertEQ(0, shadowFunctionNameWithComplexParameter());
    }
    arktest.assertEQ(0, shadowFunctionNameWithComplexParameter());
  })();
}

(function shadowOuterVariable() {
  {
    let f = 0;
    (function () {
      arktest.assertEQ(undefined, f);
      {
        arktest.assertEQ(1, f());
        function f() { return 1; }
        arktest.assertEQ(1, f());
      }
      arktest.assertEQ(1, f());
    })();
    arktest.assertEQ(0, f);
  }
})();

(function notInDefaultScope() {
  let y = 1;
  (function innerNotInDefaultScope(x = y) {
    arktest.assertEQ('undefined', typeof y);
    {
      function y() {}
    }
    arktest.assertEQ('function', typeof y);
    arktest.assertEQ(1, x);
  })();
})();

(function noHoistingThroughNestedLexical() {
  {
    let f = 2;
    {
      let y = 3;
      function f() {
        y = 2;
      }
      f();
      arktest.assertEQ(2, y);
    }
    arktest.assertEQ(2, f);
  }
  arktest.expectThrow(()=>f, ((e: Error): boolean => e instanceof ReferenceError));
})();

// Only the first function is hoisted; the second is blocked by the first.
// Contrast overridingLocalFunction, in which the outer function declaration
// is not lexical and so the inner declaration is hoisted.
(function noHoistingThroughNestedFunctions() {
  arktest.assertEQ(undefined, f); // Also checks that the var-binding exists

  {
    arktest.assertEQ(4, f());

    function f() {
      return 4;
    }

    {
      arktest.assertEQ(5, f());
      function f() {
        return 5;
      }
      arktest.assertEQ(5, f());
    }

    arktest.assertEQ(4, f());
  }

  // B.3.2.6 Changes to BlockDeclarationInstantiation
  arktest.assertEQ(5, f());
})();

// B.3.5 interacts with B.3.3 to allow this.
(function hoistingThroughSimpleCatch() {
  arktest.assertEQ(undefined, f);

  try {
    throw 0;
  } catch (f) {
    {
      arktest.assertEQ(4, f());

      function f() {
        return 4;
      }

      arktest.assertEQ(4, f());
    }

    arktest.assertEQ(0, f);
  }

  arktest.assertEQ(4, f());
})();

(function noHoistingIfLetOutsideSimpleCatch() {
  arktest.expectThrow(()=>f, ((e: Error): boolean => e instanceof ReferenceError));

  let f = 2;

  arktest.assertEQ(2, f);

  try {
    throw 0;
  } catch (f) {
    {
      arktest.assertEQ(4, f());

      function f() {
        return 4;
      }

      arktest.assertEQ(4, f());
    }

    arktest.assertEQ(0, f);
  }

  arktest.assertEQ(2, f);
})();

(function noHoistingThroughComplexCatch() {
  try {
    throw 0;
  } catch ({f}) {
    {
      arktest.assertEQ(4, f());

      function f() {
        return 4;
      }

      arktest.assertEQ(4, f());
    }
  }

  arktest.expectThrow(()=>f, ((e: Error): boolean => e instanceof ReferenceError));
})();

(function hoistingThroughWith() {
  with ({f: 0}) {
    arktest.assertEQ(0, f);

    {
      arktest.assertEQ(4, f());

      function f() {
        return 4;
      }

      arktest.assertEQ(4, f());
    }

    arktest.assertEQ(0, f);
  }

  arktest.assertEQ(4, f());
})();

// Test that hoisting from blocks does happen in global scope
function globalHoisted() { return 0; }
{
  function globalHoisted() { return 1; }
}
arktest.assertEQ(1, globalHoisted());

// Also happens when not previously defined
arktest.assertEQ(undefined, globalUndefinedHoisted);
{
  function globalUndefinedHoisted() { return 1; }
}
arktest.assertEQ(1, globalUndefinedHoisted());
const globalUndefinedHoistedDescriptor =
    Object.getOwnPropertyDescriptor(this, 'globalUndefinedHoisted');
arktest.assertFalse(globalUndefinedHoistedDescriptor.configurable);
arktest.assertTrue(globalUndefinedHoistedDescriptor.writable);
arktest.assertTrue(globalUndefinedHoistedDescriptor.enumerable);
arktest.assertEQ(1, globalUndefinedHoistedDescriptor.value());

// When a function property is hoisted, it should be
// made enumerable.
// BUG(upstream engine:4451)
Object.defineProperty(this, 'globalNonEnumerable', {
  value: false,
  configurable: true,
  writable: true,
  enumerable: false
});
eval('{function globalNonEnumerable() { return 1; }}');
const globalNonEnumerableDescriptor =
    Object.getOwnPropertyDescriptor(this, 'globalNonEnumerable');
// BUG(upstream engine:4451): Should be made non-configurable
arktest.assertTrue(globalNonEnumerableDescriptor.configurable);
arktest.assertTrue(globalNonEnumerableDescriptor.writable);
// BUG(upstream engine:4451): Should be made enumerable
arktest.assertFalse(globalNonEnumerableDescriptor.enumerable);
arktest.assertEQ(1, globalNonEnumerableDescriptor.value());

// When a function property is hoisted, it should be overwritten and
// made writable and overwritten, even if the property was non-writable.
Object.defineProperty(this, 'globalNonWritable', {
  value: false,
  configurable: true,
  writable: false,
  enumerable: true
});
eval('{function globalNonWritable() { return 1; }}');
const globalNonWritableDescriptor =
    Object.getOwnPropertyDescriptor(this, 'globalNonWritable');
// BUG(upstream engine:4451): Should be made non-configurable
arktest.assertTrue(globalNonWritableDescriptor.configurable);
// BUG(upstream engine:4451): Should be made writable
arktest.assertFalse(globalNonWritableDescriptor.writable);
arktest.assertFalse(globalNonEnumerableDescriptor.enumerable);
// BUG(upstream engine:4451): Should be overwritten
arktest.assertEQ(false, globalNonWritableDescriptor.value);

// Test that hoisting from blocks does happen in an eval
eval(`
  function evalHoisted() { return 0; }
  {
    function evalHoisted() { return 1; }
  }
  arktest.assertEQ(1, evalHoisted());
`);

// Test that hoisting from blocks happens from eval in a function
!function() {
  eval(`
    function evalInFunctionHoisted() { return 0; }
    {
      function evalInFunctionHoisted() { return 1; }
    }
    arktest.assertEQ(1, evalInFunctionHoisted());
  `);
}();

(function evalHoistingThroughSimpleCatch() {
  try {
    throw 0;
  } catch (f) {
    eval(`{ function f() {
      return 4;
    } }`);

    arktest.assertEQ(0, f);
  }

  arktest.assertEQ(4, f());
})();

(function evalHoistingThroughWith() {
  with ({f: 0}) {
    eval(`{ function f() {
      return 4;
    } }`);

    arktest.assertEQ(0, f);
  }

  arktest.assertEQ(4, f());
})();

let dontHoistGlobal;
{ function dontHoistGlobal() {} }
arktest.assertEQ(undefined, dontHoistGlobal);

let dontHoistEval;
let throws = false;
try {
  eval('{ function dontHoistEval() {} }');
} catch (e) {
  throws = true;
}
arktest.assertFalse(throws);

// When the global object is frozen, silently don't hoist
// Currently this actually throws BUG(upstream engine:4452)
Object.freeze(this);
{
  let throws = false;
  try {
    eval('{ function hoistWhenFrozen() {} }');
  } catch (e) {
    throws = true;
  }
  arktest.assertFalse(this.hasOwnProperty('hoistWhenFrozen'));
  arktest.expectThrow(() => hoistWhenFrozen, ((e: Error): boolean => e instanceof ReferenceError));
  // Should be arktest.assertFalse BUG(upstream engine:4452)
  arktest.assertTrue(throws);
}

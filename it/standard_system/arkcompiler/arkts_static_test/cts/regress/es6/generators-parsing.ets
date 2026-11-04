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

// Test basic generator syntax.

// Yield statements.

/*---
tags: [compile-only, negative]
expected_out_1: >-
  Syntax error ESY0314: Generator functions are not supported, please use
  async/await mechanism for multitasking
---*/

function* g() { yield 3; yield 4; }

// Yield expressions.
function* g() { (yield 3) + (yield 4); }

// Yield without a RHS.
function* g() { yield; }
function* g() { yield }
function* g() {
  yield
}
function* g() { (yield) }
function* g() { [yield] }
function* g() { {yield} }
function* g() { yield, yield }
function* g() { yield; yield }
function* g() { (yield) ? yield : yield }
function* g() {
  (yield)
  ? yield
  : yield
}

// If yield has a RHS, it needs to start on the same line.  The * in a
// yield* counts as starting the RHS.
function* g() {
  yield *
  foo
}
arktest.expectThrow('function* g() { yield\n* foo }', ((e: Error): boolean => e instanceof SyntaxError));
arktest.assertEQ(undefined,
             (function*(){
               yield
               3
             })().next().value);

// A YieldExpression is not a LogicalORExpression.
arktest.expectThrow('function* g() { yield ? yield : yield }', ((e: Error): boolean => e instanceof SyntaxError));

// You can have a generator in strict mode.
function* g() { 'use strict'; yield 3; yield 4; }

// Generators can have return statements also, which internally parse to a kind
// of yield expression.
function* g() { yield 1; return; }
function* g() { yield 1; return 2; }
function* g() { yield 1; return 2; yield 'dead'; }

// Generator expression.
(function* () { yield 3; });

// Named generator expression.
(function* g() { yield 3; });

// You can have a generator without a yield.
function* g() { }

// A YieldExpression is valid as the RHS of a YieldExpression.
function* g() { yield yield 1; }
function* g() { yield 3 + (yield 4); }

// Generator definitions with a name of "yield" are not specifically ruled out
// by the spec, as the `yield' name is outside the generator itself.  However,
// in strict-mode, "yield" is an invalid identifier.
function* yield() { (yield 3) + (yield 4); }
arktest.expectThrow('function* yield() { "use strict"; (yield 3) + (yield 4); }',
             SyntaxError);

// In sloppy mode, yield is a normal identifier, outside of generators.
function yield(yield) { yield: yield (yield + yield (0)); }

// Yield is always valid as a key in an object literal.
({ yield: 1 });
function* g() { yield ({ yield: 1 }) }
function* g() { yield ({ get yield() { return 1; }}) }

// Checks that yield is a valid label in sloppy mode, but not valid in a strict
// mode or in generators.
function f() { yield: 1 }
arktest.expectThrow('function f() { "use strict"; yield: 1 }', ((e: Error): boolean => e instanceof SyntaxError))
arktest.expectThrow('function* g() { yield: 1 }', ((e: Error): boolean => e instanceof SyntaxError))

// Yield is only a keyword in the body of the generator, not in nested
// functions.
function* g() { function f() { yield (yield + yield (0)); } }

// Yield in a generator is not an identifier.
arktest.expectThrow('function* g() { yield = 10; }', ((e: Error): boolean => e instanceof SyntaxError));

// Yield binds very loosely, so this parses as "yield (3 + yield 4)", which is
// invalid.
arktest.expectThrow('function* g() { yield 3 + yield 4; }', ((e: Error): boolean => e instanceof SyntaxError));

// Yield is still a future-reserved-word in strict mode
arktest.expectThrow(
  'function f() { "use strict"; var yield = 13; }',
  ((e: Error): boolean => e instanceof SyntaxError)
);

// The name of the NFE is bound in the generator expression, so is invalid.
arktest.expectThrow('function f() { (function* yield() {}); }', ((e: Error): boolean => e instanceof SyntaxError));

// In generators, yield is invalid as a formal argument name.
arktest.expectThrow('function* g(yield) { yield (10); }', ((e: Error): boolean => e instanceof SyntaxError));

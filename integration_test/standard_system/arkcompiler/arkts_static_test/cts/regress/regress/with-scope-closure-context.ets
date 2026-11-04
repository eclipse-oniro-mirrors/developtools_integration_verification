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

// Whenever we enter a with-scope, we copy the context. This in itself is fine
// (contexts may escape), but when leaving a with-scope, we currently also copy
// the context instead of reverting to the original. This does not work because
// inner functions may already have been created using the original context. In
// the failing test case below, the inner function is run in the original context
// (where x is undefined), but the assignment to x after the with-statement is
// run in the copied context:

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

const result = (function outer() {
 with ({}) { }
 const x = 10;
 function inner() {
   return x;
 };
 return inner();
})();

arktest.assertEQ(10, result);

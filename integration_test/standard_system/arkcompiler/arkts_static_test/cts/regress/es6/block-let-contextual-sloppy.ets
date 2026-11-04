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

// let is usable as a variable with var, but not let or ES6 const

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function (){
  arktest.assertEQ(undefined, let);

  let let;

  let = 5;
  arktest.assertEQ(5, let);

  (function() { let let = 1; arktest.assertEQ(1, let); })();
  arktest.assertEQ(5, let);
})();

arktest.expectThrow(function() { return let; }, ((e: Error): boolean => e instanceof ReferenceError));

(function() {
   let let, sum = 0;
   for (let in [1, 2, 3, 4]) {
     sum += Number(let);
   }
   arktest.assertEQ(6, sum);

   (function() { for (let let of [4, 5]) sum += let; })();
   arktest.assertEQ(15, sum);

   (function() { for (let let in [6]) sum += Number([6][let]); })();
   arktest.assertEQ(21, sum);

   for (let = 7; let < 8; let++) {
     sum += let;
   }
   arktest.assertEQ(28, sum);
   arktest.assertEQ(8, let);

   (function() { for (let let = 8; let < 9; let++) sum += let; })();
   arktest.assertEQ(36, sum);
   arktest.assertEQ(8, let);
})();

arktest.expectThrow(function() { return let; }, ((e: Error): boolean => e instanceof ReferenceError));

(function () {
  let obj = {};
  let {let} = {let() { return obj; }};
  let().x = 1;
  arktest.assertEQ(1, obj.x);
})();

(function() {
  function let() {
    return 1;
  }
  arktest.assertEQ(1, let());
})()

arktest.expectThrow('for (let of []) {}', ((e: Error): boolean => e instanceof SyntaxError));

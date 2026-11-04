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
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

let testId = 0;

function testTrunc(expected, input) {
  const test = new Function('n',
                          '"' + (testId++) + '";return Math.trunc(n)');
  ArkTools.prepareFunctionForOptimization(test);
  arktest.assertEQ(expected, test(input));
  arktest.assertEQ(expected, test(input));
  arktest.assertEQ(expected, test(input));
  ArkTools.optimizeFunctionOnNextCall(test);
  arktest.assertEQ(expected, test(input));

  const testDoubleInput = new Function(
      'n',
      '"' + (testId++) + '";return Math.trunc(+n)');
  ArkTools.prepareFunctionForOptimization(testDoubleInput);
  arktest.assertEQ(expected, testDoubleInput(input));
  arktest.assertEQ(expected, testDoubleInput(input));
  arktest.assertEQ(expected, testDoubleInput(input));
  ArkTools.optimizeFunctionOnNextCall(testDoubleInput);
  arktest.assertEQ(expected, testDoubleInput(input));

  const testDoubleOutput = new Function(
      'n',
      '"' + (testId++) + '";return Math.trunc(n) + -0.0');
  ArkTools.prepareFunctionForOptimization(testDoubleOutput);
  arktest.assertEQ(expected, testDoubleOutput(input));
  arktest.assertEQ(expected, testDoubleOutput(input));
  arktest.assertEQ(expected, testDoubleOutput(input));
  ArkTools.optimizeFunctionOnNextCall(testDoubleOutput);
  arktest.assertEQ(expected, testDoubleOutput(input));
}

function test() {
  // Ensure that a negative zero coming from Math.trunc is properly handled
  // by other operations.
  function itrunc(x) {
    return 1 / Math.trunc(x);
  }
  ArkTools.prepareFunctionForOptimization(itrunc);
  arktest.assertEQ(Infinity, itrunc(0));
  arktest.assertEQ(-Infinity, itrunc(-0));
  arktest.assertEQ(Infinity, itrunc(Math.PI / 4));
  arktest.assertEQ(-Infinity, itrunc(-Math.sqrt(2) / 2));
  arktest.assertEQ(-Infinity, itrunc({valueOf: function() { return '-0.1'; }}));
  ArkTools.optimizeFunctionOnNextCall(itrunc);

  testTrunc(100, 100);
  testTrunc(-199, -199);
  testTrunc(100, 100.1);
  testTrunc(4503599627370495.0, 4503599627370495.0);
  testTrunc(4503599627370496.0, 4503599627370496.0);
  testTrunc(-4503599627370495.0, -4503599627370495.0);
  testTrunc(-4503599627370496.0, -4503599627370496.0);
  testTrunc(9007199254740991.0, 9007199254740991.0);
  testTrunc(-9007199254740991.0, -9007199254740991.0);
  testTrunc(0, []);
  testTrunc(1, [1]);
  testTrunc(-100, [-100.1]);
  testTrunc(-100, {toString: function() { return '-100.3'; }});
  testTrunc(10, {toString: function() { return 10.1; }});
  testTrunc(-1, {valueOf: function() { return -1.1; }});
  testTrunc(-Infinity, -Infinity);
  testTrunc(Infinity, Infinity);
  testTrunc(-Infinity, '-Infinity');
  testTrunc(Infinity, 'Infinity');

  arktest.assertTrue(isNaN(Math.trunc('abc')));
  arktest.assertTrue(isNaN(Math.trunc({})));
  arktest.assertTrue(isNaN(Math.trunc([1, 1])));
}

// Test in a loop to cover the custom IC and GC-related issues.
for (let i = 0; i < 10; i++) {
  test();
  new Array(i * 10000);
}

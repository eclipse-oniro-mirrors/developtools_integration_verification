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

// This gets very slow with stress flags, and triggers optimization anyway:

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function testLargeClassesProperties(){
  // This is to test for dictionary mode when there more than
  // kMaxNumberOfDescriptors (1024) properties.
  const kLimit = 1030;
  let evalString = 'function f(i) { ' +
      'let clazz = class { ' +
      '   constructor(i) { this.value = i;';
  for (let i = 0; i < kLimit ; i++) {
    evalString  += 'this.property'+i +' = '+i+'; '
  }
  evalString += '}};' +
      ' return (new clazz(i)); }; f;';

  let fn = eval(evalString);
  ArkTools.prepareFunctionForOptimization(fn);
  arktest.assertEQ(fn(1).value, 1);
  arktest.assertEQ(fn(2).value, 2);
  arktest.assertEQ(fn(3).value, 3);
  ArkTools.optimizeFunctionOnNextCall(fn);
  arktest.assertEQ(fn(4).value, 4);

  let instance = fn(1);
  arktest.assertEQ(Object.getOwnPropertyNames(instance).length, kLimit+1);

  // Get and set all properties.
  for (let i = 0; i < kLimit; i++) {
    const key = 'property' + i;
    arktest.assertEQ(instance[key], i);
    const value = 'value'+i;
    instance[key] = value;
    arktest.assertEQ(instance[key], value);
  }
})();

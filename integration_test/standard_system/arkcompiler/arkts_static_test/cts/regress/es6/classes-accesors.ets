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
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

let b = 'b';

(function TestOverwritingInstanceAccessors() {
  let C;
  let desc;
  C = class {
    [b]() { return 'B'; };
    get b() { return 'get B'; };
  };
  desc = Object.getOwnPropertyDescriptor(C.prototype, 'b');
  arktest.assertFalse(desc.enumerable);
  arktest.assertTrue(desc.configurable);
  arktest.assertEQ('get B', desc.get());
  arktest.assertEQ(undefined, desc.set);

  C = class {
    [b]() { return 'B'; };
    set b(v) { return 'set B'; };
  };
  desc = Object.getOwnPropertyDescriptor(C.prototype, 'b');
  arktest.assertFalse(desc.enumerable);
  arktest.assertTrue(desc.configurable);
  arktest.assertEQ(undefined, desc.get);
  arktest.assertEQ('set B', desc.set());

  C = class {
    set b(v) { return 'get B'; };
    [b]() { return 'B'; };
    get b() { return 'get B'; };
  };
  desc = Object.getOwnPropertyDescriptor(C.prototype, 'b');
  arktest.assertFalse(desc.enumerable);
  arktest.assertTrue(desc.configurable);
  arktest.assertEQ('get B', desc.get());
  arktest.assertEQ(undefined, desc.set);

  C = class {
    get b() { return 'get B'; };
    [b]() { return 'B'; };
    set b(v) { return 'set B'; };
  };
  desc = Object.getOwnPropertyDescriptor(C.prototype, 'b');
  arktest.assertFalse(desc.enumerable);
  arktest.assertTrue(desc.configurable);
  arktest.assertEQ(undefined, desc.get);
  arktest.assertEQ('set B', desc.set());
})();

(function TestOverwritingStaticAccessors() {
  let C;
  let desc;
  C = class {
    static [b]() { return 'B'; };
    static get b() { return 'get B'; };
  };
  desc = Object.getOwnPropertyDescriptor(C, 'b');
  arktest.assertFalse(desc.enumerable);
  arktest.assertTrue(desc.configurable);
  arktest.assertEQ('get B', desc.get());
  arktest.assertEQ(undefined, desc.set);

  C = class {
    static [b]() { return 'B'; };
    static set b(v) { return 'set B'; };
  };
  desc = Object.getOwnPropertyDescriptor(C, 'b');
  arktest.assertFalse(desc.enumerable);
  arktest.assertTrue(desc.configurable);
  arktest.assertEQ(undefined, desc.get);
  arktest.assertEQ('set B', desc.set());

  C = class {
    static set b(v) { return 'get B'; };
    static [b]() { return 'B'; };
    static get b() { return 'get B'; };
  };
  desc = Object.getOwnPropertyDescriptor(C, 'b');
  arktest.assertFalse(desc.enumerable);
  arktest.assertTrue(desc.configurable);
  arktest.assertEQ('get B', desc.get());
  arktest.assertEQ(undefined, desc.set);

  C = class {
    static get b() { return 'get B'; };
    static [b]() { return 'B'; };
    static set b(v) { return 'set B'; };
  };
  desc = Object.getOwnPropertyDescriptor(C, 'b');
  arktest.assertFalse(desc.enumerable);
  arktest.assertTrue(desc.configurable);
  arktest.assertEQ(undefined, desc.get);
  arktest.assertEQ('set B', desc.set());
})();

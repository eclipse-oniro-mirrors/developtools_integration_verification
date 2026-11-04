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
expected_out_1: "Semantic error ESE0143: Unresolved reference eval"
---*/

'use strict';

class Base {
  m() {
    return 42;
  }
}

class Derived extends Base {
  m() {
    return super.m();
  }
  evalM() {
    return eval('super.m()');
  }
}

arktest.assertEQ(42, new Derived().m());
arktest.assertEQ(42, new Derived().evalM());


class LazyDerived extends Base {
  constructor() {
    eval('super()');
  }
}
arktest.assertTrue(new LazyDerived() instanceof LazyDerived);
arktest.assertTrue(new LazyDerived() instanceof Base);

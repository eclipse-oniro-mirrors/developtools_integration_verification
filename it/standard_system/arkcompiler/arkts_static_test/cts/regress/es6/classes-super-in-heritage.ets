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
expected_out_1: "Semantic error ESE0020: Class literal is not yet supported."
---*/

class A {
  getValue() {
    return 'A';
  }

  static extend() {
    return class extends this {
      getValue() {
        return 'A.extend:' + super.getValue();
      }
    }
  }
}

class B extends A {
  getValue() {
    return 'B:' + super.getValue();
  }

  static extend() {
    return class extends super.extend() {
      getValue() {
        return 'B.extend:' + super.getValue();
      }
    }
  }

  static extend2() {
    // Have 2 uses of super to test the Scope's cache.
    let x = super.extend();
    return class extends super.extend() {
      getValue() {
        return 'B.extend:' + super.getValue();
      }
    }
  }
}

const C = B.extend();
const c = new C();
arktest.assertEQ(c.getValue(), 'B.extend:A.extend:B:A');

const C2 = B.extend2();
const c2 = new C2();
arktest.assertEQ(c2.getValue(), 'B.extend:A.extend:B:A');

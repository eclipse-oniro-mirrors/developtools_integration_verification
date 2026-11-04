/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
/**
 * @id EXP_07_28_02_016_RUNTIME_ALL_SPEC_EXAMPLES
 * @expect runtime
 * @section 7.28.2
 * @design 验证 spec 中所有 Function Type Equality Operators 示例的运行时行为
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function assert(cond: boolean, msg: string): void {
  if (!cond) {
    throw new Error('FAIL: ' + msg);
  }
  }
  }
  }
  }
}

function foo(): void {}
function bar(): void {}
function goo(p: number): void {}

class A {
  method(): void {}
  static method(): void {}
  foo(): void {}
}

function main(): void {
  // ===== 顶级函数 =====
  // foo == foo // true, same function object
  assert(foo == foo, "foo == foo should be true (spec)");

  // foo == bar // false, different function objects
  assert((foo == bar) == false, "foo == bar should be false (spec)");

  // foo == goo // false, different function objects
  assert((foo == goo) == false, "foo == goo should be false (spec)");

  // ===== 实例和静态方法 =====
  const a = new A();

  // a.method == a.method // true, same function object
  assert(a.method == a.method, "a.method == a.method should be true (spec)");

  // A.method == A.method // true, same function object
  assert(A.method == A.method, "A.method == A.method should be true (spec)");

  // ===== 不同实例 =====
  const obj2 = new A();

  // a.method == obj2.method // false, different bounded objects
  assert((a.method == obj2.method) == false, "a.method == obj2.method should be false (spec)");

  // a.method == a.foo // false, different function objects
  assert((a.method == a.foo) == false, "a.method == a.foo should be false (spec)");

  console.log('verified');
}

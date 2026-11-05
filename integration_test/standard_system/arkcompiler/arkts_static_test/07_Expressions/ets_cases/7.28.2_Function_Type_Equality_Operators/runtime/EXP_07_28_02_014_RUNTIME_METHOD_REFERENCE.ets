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
 * @id EXP_07_28_02_014_RUNTIME_METHOD_REFERENCE
 * @expect runtime
 * @section 7.28.2
 * @design 验证实例和静态方法引用等值比较的运行时正确性
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

class A {
  method(): void {}
  static method(): void {}
  foo(): void {}
}

function main(): void {
  const a = new A();
  const obj2 = new A();

  // 同一实例同一方法（spec 示例）
  assert(a.method == a.method, "a.method == a.method should be true (spec example)");

  // 静态方法（spec 示例）
  assert(A.method == A.method, "A.method == A.method should be true (spec example)");

  // 不同实例同一方法（spec 示例）
  assert((a.method == obj2.method) == false, "a.method == obj2.method should be false (spec example)");

  // 同一实例不同方法（spec 示例）
  assert((a.method == a.foo) == false, "a.method == a.foo should be false (spec example)");

  // != 验证
  assert(a.method != obj2.method, 'a.method != obj2.method should be true');
  assert(a.method != a.foo, 'a.method != a.foo should be true');
  assert((a.method != a.method) == false, 'a.method != a.method should be false');
  assert((A.method != A.method) == false, 'A.method != A.method should be false');

  console.log('verified');
}

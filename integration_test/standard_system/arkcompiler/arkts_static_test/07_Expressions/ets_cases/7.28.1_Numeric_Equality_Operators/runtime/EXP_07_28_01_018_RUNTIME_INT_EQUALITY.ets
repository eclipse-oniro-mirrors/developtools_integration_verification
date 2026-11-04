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
 * @id EXP_07_28_01_018_RUNTIME_INT_EQUALITY
 * @expect runtime
 * @section 7.28.1
 * @design 验证 int 类型 ==, !=, ===, !== 等值运算符的运行时正确性
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

function main(): void {
  // ===== spec 示例 =====
  assert(5 == 5, '5 == 5 should be true (spec example)');
  assert((5 != 5) == false, '5 != 5 should be false (spec example)');
  assert(5 === 5, '5 === 5 should be true (spec example)');

  // ===== 基本 bool =====
  assert((5 == 10) == false, '5 == 10 should be false');
  assert(5 != 10, '5 != 10 should be true');
  assert((10 === 5) == false, '10 === 5 should be false');
  assert(10 !== 5, '10 !== 5 should be true');
  assert(0 == 0, '0 == 0 should be true');
  assert((0 != 0) == false, '0 != 0 should be false');

  // ===== 负数 =====
  assert(-1 == -1, "-1 == -1 should be true");
  assert(-1 != 1, "-1 != 1 should be true");
  assert(-5 == -5, "-5 == -5 should be true");

  // ===== 边界值 =====
  assert(2147483647 == 2147483647, 'INT_MAX == INT_MAX should be true');
  assert((-2147483647 - 1) == (-2147483647 - 1), 'INT_MIN == INT_MIN should be true');
  assert(2147483647 != 0, 'INT_MAX != 0 should be true');
  assert((-2147483647 - 1) != 2147483647, 'INT_MIN != INT_MAX should be true');

  // ===== 变量与字面量 =====
  let a: int = 42;
  let b: int = 42;
  assert(a == b, 'a == b (both 42) should be true');
  assert((a != b) == false, 'a != b (both 42) should be false');
  assert(a === b, 'a === b (both 42 int) should be true');

  let c: int = 100;
  assert((a == c) == false, '42 == 100 should be false');
  assert(a != c, '42 != 100 should be true');

  // ===== === 与 !== 对 int =====
  assert(42 === 42, '42 === 42 should be true');
  assert((42 === 43) == false, '42 === 43 should be false');
  assert(42 !== 43, '42 !== 43 should be true');
  assert((42 !== 42) == false, '42 !== 42 should be false');

  console.log('verified');
}

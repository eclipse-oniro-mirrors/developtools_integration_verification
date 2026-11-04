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
 * @id EXP_07_28_01_021_RUNTIME_BIGINT
 * @expect runtime
 * @section 7.28.1
 * @design 验证 bigint 等值比较运行时正确性，以及 bigint 与数值类型比较（结果为 false）
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
  // ===== bigint == bigint =====
  assert(5n == 5n, '5n == 5n should be true');
  assert((5n == 10n) == false, '5n == 10n should be false');
  assert(5n != 10n, '5n != 10n should be true');
  assert((5n != 5n) == false, '5n != 5n should be false');

  // ===== bigint ===/!== =====
  assert(5n === 5n, '5n === 5n should be true');
  assert((5n === 10n) == false, '5n === 10n should be false');
  assert(5n !== 10n, '5n !== 10n should be true');
  assert((5n !== 5n) == false, '5n !== 5n should be false');

  // ===== 大数 bigint =====
  let bigA: bigint = 1000000000000000000000000000000n;
  let bigB: bigint = 1000000000000000000000000000000n;
  let bigC: bigint = 999999999999999999999999999999n;
  assert(bigA == bigB, 'large bigint equal should be true');
  assert((bigA == bigC) == false, 'different bigints should be false');
  assert(bigA != bigC, 'different bigints != should be true');

  // ===== 负 bigint =====
  assert(-5n == -5n, "-5n == -5n should be true");
  assert((-5n == 5n) == false, "-5n == 5n should be false");

  // ===== bigint vs numeric（结果为 false） =====
  // spec: If one operand is bigint and the other is numeric, the result is false
  assert((5n == 5) == false, '5n == 5 should be false (bigint vs int)');
  assert((5n == 5.0f) == false, '5n == 5.0f should be false (bigint vs float)');
  assert((5n == 5.0) == false, '5n == 5.0 should be false (bigint vs double)');
  assert(5n != 5, '5n != 5 should be true (bigint vs int)');

  // ===== bigint vs numeric ===/!== =====
  assert((5n === 5) == false, '5n === 5 should be false (bigint vs int)');
  assert(5n !== 5, '5n !== 5 should be true (bigint vs int)');

  // ===== bigint 0 =====
  assert(0n == 0n, '0n == 0n should be true');
  assert((0n == 1n) == false, '0n == 1n should be false');
  assert((0n == 0) == false, '0n == 0 should be false (bigint vs int)');

  console.log('verified');
}

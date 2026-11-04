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
 * @id EXP_07_28_01_008_PASS_BIGINT_EQUALITY
 * @expect compile-pass
 * @section 7.28.1
 * @design 验证 bigint 类型的 ==, !=, ===, !== 等值比较编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let a: bigint = 5n;
  let b: bigint = 10n;

  // bigint == bigint
  let r1: boolean = a == b;
  let r2: boolean = a != b;
  let r3: boolean = a === b;
  let r4: boolean = a !== b;

  // 字面量比较
  let r5: boolean = 5n == 5n;
  let r6: boolean = 5n != 10n;
  let r7: boolean = -5n == -5n;
  let r8: boolean = 0n == 0n;
}

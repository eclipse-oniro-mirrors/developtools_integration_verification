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
 * @id EXP_07_28_01_001_PASS_INT_EQUALITY
 * @expect compile-pass
 * @section 7.28.1
 * @design 验证 int 类型的 ==, !=, ===, !== 四个等值运算符编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let a: int = 5;
  let b: int = 10;
  let r1: boolean = a == b;
  let r2: boolean = a != b;
  let r3: boolean = a === b;
  let r4: boolean = a !== b;

  // 字面量直接比较
  let r5: boolean = 0 == 0;
  let r6: boolean = -1 != 5;
  let r7: boolean = 100 === 100;
  let r8: boolean = -2147483648 !== 0;
}

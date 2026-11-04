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
 * @id EXP_07_28_01_010_PASS_OBJECT_WRAPPER
 * @expect compile-pass
 * @section 7.28.1
 * @design 验证数值与 Number 转换结果等值比较（spec 示例：5 == Number(5)）
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let i: int = 5;
  let n: number = Number(5);

  // spec example: 5 == Number(5) // true
  let r1: boolean = i == n;
  // spec example: 5 === Number(5) // true
  let r2: boolean = i === n;
  // !=
  let r3: boolean = i != n;
  let r4: boolean = i !== n;
}

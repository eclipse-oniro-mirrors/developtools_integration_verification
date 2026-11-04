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
 * @id EXP_07_25_02_001_PASS_INT_ADD_BASIC
 * @expect compile-pass
 * @section 7.25.2
 * @design 验证 int+int→int 类型保持，int-int→int 基本加减法编译通过。
 *         spec：同类型整数加法结合律成立；结果类型是最大类型。
 * @note 正向用例：纯 int 加减法编译通过
 */
function main(): void {
  let a: int = 5
  let b: int = 3

  // int + int → int
  let r1 = a + b
  let t1 = typeof(r1)
  if (t1 != 'int') {
    throw new Error('int+int should be int, got ' + t1)
  }

  // int - int → int
  let r2 = a - b
  let t2 = typeof(r2)
  if (t2 != 'int') {
    throw new Error('int-int should be int, got ' + t2)
  }

  // short + int → int (short widened to int)
  let s: short = 10
  let r3 = s + a
  let t3 = typeof(r3)
  if (t3 != 'int') {
    throw new Error('short+int should be int, got ' + t3)
  }
console.log('verified')
}
main()

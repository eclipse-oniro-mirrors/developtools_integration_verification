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
 * @id CON_06_04_03_017_RUNTIME_ENUM_TO_UNION
 * @expect runtime
 * @section 6.4.3
 * @design 枚举→联合类型的运行时值保留
 * @note 运行时用例：验证枚举→联合转换
 */
enum E { A, B, C }

function main(): void {
  let e: E = E.B
  let u: int | long = e
  if (u != 1) {
    throw new Error('assertion: enum→int|long should be 1, got ' + u)
  }

  let e2: E = E.C
  let u2: int | double = e2
  if (u2 != 2) {
    throw new Error('assertion: enum→int|double should be 2')
  }

  console.log('Enum to union verified')
}

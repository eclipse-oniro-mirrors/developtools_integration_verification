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
 * @id CON_06_04_02_016_RUNTIME_UNION_ASSIGN_CHAIN
 * @expect runtime
 * @section 6.4.2
 * @design 联合类型多次赋值链运行时行为
 * @note 运行时用例：验证联合变量多种来源赋值后的值正确性
 */
function main(): void {
  let u: byte | int = 256

  let b: byte = 1
  u = b
  if (u != 1) {
    throw new Error('assertion: byte→union')
  }

  let i: int = 100
  u = i
  if (u != 100) {
    throw new Error('assertion: int→union')
  }

  u = 200
  if (u != 200) {
    throw new Error('assertion: literal→union')
  }

  let s: short = 50
  u = s
  if (u != 50) {
    throw new Error('assertion: short→union widening')
  }

  console.log('Union assign chain verified')
}

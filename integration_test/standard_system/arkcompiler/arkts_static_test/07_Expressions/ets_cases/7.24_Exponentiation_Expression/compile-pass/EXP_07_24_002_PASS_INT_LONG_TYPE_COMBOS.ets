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
 * @id EXP_07_24_002_PASS_INT_LONG_TYPE_COMBOS
 * @expect compile-pass
 * @section 7.24
 * @design 验证 int/long 类型在幂运算中提升为 double（number 类型）：int**int→number, int**long→number, long**long→number
 * @note 正向用例：验证 int/long 到 double 的隐式提升
 */
function main(): void {
  let a: int = 2
  let b: int = 10
  let c: long = 3
  let d: long = 4
  let e: number = a ** b   // int**int→number
  let f: number = a ** c   // int**long→number
  let g: number = c ** d   // long**long→number
  let h: number = c ** a   // long**int→number
  console.log('verified')
}

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
 * @id TYP_03_06_03_030_RUNTIME_INT_DIV_FLOAT_ZERO
 * @expect runtime
 * @section 3.6.3
 * @design 整数 / 浮点 0.0 → +Infinity（混合类型推升为浮点除法）
 * @note 运行时用例：混合类型 int/double 0.0 按浮点规则处理
 *       关键：编译通过！只要除数是浮点类型字面量，即使整数被除数也按 IEEE 754
 */
function main(): void {
  let c: double = 10 / 0.0
  let posInf: double = 1.0 / 0.0
  if (c != posInf) {
    throw new Error("10/0.0 should be +Infinity")
  }
  console.log("10/0.0 = Infinity verified")
}
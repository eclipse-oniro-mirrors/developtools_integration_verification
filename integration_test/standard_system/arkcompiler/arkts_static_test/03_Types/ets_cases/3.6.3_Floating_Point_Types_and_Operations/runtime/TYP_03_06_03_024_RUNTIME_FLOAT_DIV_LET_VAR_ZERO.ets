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
 * @id TYP_03_06_03_024_RUNTIME_FLOAT_DIV_LET_VAR_ZERO
 * @expect runtime
 * @section 3.6.3
 * @design let 变量 0.0 作除数 → +Infinity（编译通过，无运行时错误）
 * @note 运行时用例：浮点除零完全 IEEE 754 兼容
 */
function main(): void {
  let a: double = 0.0
  let c: double = 5.0 / a
  let posInf: double = 1.0 / 0.0
  if (c != posInf) {
    throw new Error("5.0/let_zero should be +Infinity")
  }
  console.log("5.0/let_zero = Infinity verified")
}
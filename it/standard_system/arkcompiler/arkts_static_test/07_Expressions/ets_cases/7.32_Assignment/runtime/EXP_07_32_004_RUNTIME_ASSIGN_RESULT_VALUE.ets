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
 * @id EXP_07_32_004_RUNTIME_ASSIGN_RESULT_VALUE
 * @expect runtime
 * @section 7.32
 * @design 赋值表达式返回赋值后的值

 * @note 运行时用例：实际执行验证赋值表达式结果值
 */
function main(): void {
  let a: int = 0
  let b: int = 0
  let c: int = a = b = 5
  if (c != 5) {
    throw new Error('assertion: c should be 5')
  }
  if (a != 5) {
    throw new Error('assertion: a should be 5')
  }
  if (b != 5) {
    throw new Error('assertion: b should be 5')
  }
console.log('verified')
}

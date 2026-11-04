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
 * @id EXP2_17_13_4_011_RUNTIME_LAMBDA_RECEIVER_EXECUTION
 * @expect runtime
 * @section 17.13.4
 * @design 运行时验证：带接收者的lambda通过普通调用正确执行
 * @note 运行时用例：实际执行验证lambda接收者
 */
class NumStore { public value: number = 0 }
function main(): void {
  let square = (this: NumStore): number => { let v: number = this.value; return v * v }
  let ns: NumStore = new NumStore(); ns.value = 7
  let r: number = square(ns)
  if (r != 49) { throw new Error('assertion failed: expected 49, got ' + r) }
  console.log('verified')
}

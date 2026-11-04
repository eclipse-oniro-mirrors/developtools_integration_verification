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
 * @id EXP2_17_13_5_010_RUNTIME_EXPLICIT_THIS_RESOLVE
 * @expect runtime
 * @section 17.13.5
 * @design 运行时验证：显式 this 正确解析到接收者成员并产生正确结果
 * @note 运行时用例：实际执行验证显式this解析
 */
class Calculator { public operand: number = 0 }
function main(): void {
  let compute = (this: Calculator): number => { return this.operand * this.operand + this.operand }
  let calc: Calculator = new Calculator(); calc.operand = 5
  let r: number = compute(calc)
  if (r != 30) { throw new Error('assertion failed: expected 30, got ' + r) }
  console.log('verified')
}

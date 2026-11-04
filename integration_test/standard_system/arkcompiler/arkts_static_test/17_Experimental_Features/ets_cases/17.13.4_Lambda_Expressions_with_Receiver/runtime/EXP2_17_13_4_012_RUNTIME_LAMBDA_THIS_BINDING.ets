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
 * @id EXP2_17_13_4_012_RUNTIME_LAMBDA_THIS_BINDING
 * @expect runtime
 * @section 17.13.4
 * @design 运行时验证：lambda接收者内this正确绑定到接收者对象
 * @note 运行时用例：实际执行验证lambda内this绑定
 */
class Wallet { public amount: number = 0 }
function main(): void {
  let checkBalance = (this: Wallet): string => { return 'balance:' + this.amount }
  let w1: Wallet = new Wallet(); w1.amount = 100
  let r1: string = checkBalance(w1)
  if (r1 != "balance:100") { throw new Error("assertion failed: expected 'balance:100', got '" + r1 + ''') }
  let w2: Wallet = new Wallet(); w2.amount = 500
  let r2: string = checkBalance(w2)
  if (r2 != "balance:500") { throw new Error("assertion failed: expected 'balance:500', got '" + r2 + ''') }
  console.log('verified')
}

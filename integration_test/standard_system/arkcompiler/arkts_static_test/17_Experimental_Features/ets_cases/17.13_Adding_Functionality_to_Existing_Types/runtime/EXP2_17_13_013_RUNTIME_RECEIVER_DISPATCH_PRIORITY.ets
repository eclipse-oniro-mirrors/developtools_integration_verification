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
 * @id EXP2_17_13_013_RUNTIME_RECEIVER_DISPATCH_PRIORITY
 * @expect runtime
 * @section 17.13
 * @design 运行时验证实例方法优先于 receiver 函数的分派优先级
 * @note 运行时用例：验证同签名实例方法调用优先级高于 receiver 函数
 */
class Greeter {
  greet(): string { return 'class-greet' }
}

class Calculator {
  public value: int = 0
}

function addValue(this: Calculator, x: int): Calculator { this.value += x; return this }
function getValue(this: Calculator): int { return this.value }

function main(): void {
  let c: Calculator = new Calculator()
  c.addValue(10).addValue(20)
  let r: int = c.getValue()
  console.log(r.toString())
}

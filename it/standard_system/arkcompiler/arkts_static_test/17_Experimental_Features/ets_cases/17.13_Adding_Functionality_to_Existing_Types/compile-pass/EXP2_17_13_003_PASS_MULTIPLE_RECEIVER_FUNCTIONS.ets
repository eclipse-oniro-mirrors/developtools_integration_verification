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
 * @id EXP2_17_13_003_PASS_MULTIPLE_RECEIVER_FUNCTIONS
 * @expect compile-pass
 * @section 17.13
 * @design 同一类型的多个接收者函数：为同一类型定义多个不同的顶层接收者函数，均可通过方法调用语法使用
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Calculator {
  public value: number = 0
}

function addFunc(this: Calculator, x: number): void {
  this.value = this.value + x
}

function subtractFunc(this: Calculator, x: number): void {
  this.value = this.value - x
}

function multiplyFunc(this: Calculator, x: number): void {
  this.value = this.value * x
}

function testMultipleReceiverFunctions(): void {
  let calc: Calculator = new Calculator()
  calc.addFunc(10)
  calc.subtractFunc(3)
  calc.multiplyFunc(2)
  console.log('compiled successfully')
}

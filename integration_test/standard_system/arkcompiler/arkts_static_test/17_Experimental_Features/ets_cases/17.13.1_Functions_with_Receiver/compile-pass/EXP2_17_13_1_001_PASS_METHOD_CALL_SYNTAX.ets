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
 * @id EXP2_17_13_1_001_PASS_METHOD_CALL_SYNTAX
 * @expect compile-pass
 * @section 17.13.1
 * @design 基本接收者函数通过方法调用语法调用：顶层接收者函数可通过 receiver.funcName(args) 调用
 * @note 正向用例：验证该特性编译通过的正确用法。注意：double 是 ArkTS 关键字，函数名使用 multiplyBy2
 */
class MyNumber { public value: number = 0 }
function multiplyBy2(this: MyNumber): number { return this.value * 2 }
function testMethodCallSyntax(): void {
  let n: MyNumber = new MyNumber()
  n.value = 10
  let result: number = n.multiplyBy2()
  console.log('compiled successfully')
}

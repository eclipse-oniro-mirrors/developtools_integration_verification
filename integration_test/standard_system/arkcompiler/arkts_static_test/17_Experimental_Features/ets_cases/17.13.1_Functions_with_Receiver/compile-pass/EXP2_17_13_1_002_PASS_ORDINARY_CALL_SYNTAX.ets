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
 * @id EXP2_17_13_1_002_PASS_ORDINARY_CALL_SYNTAX
 * @expect compile-pass
 * @section 17.13.1
 * @design 接收者函数通过普通函数调用语法调用：funcName(receiver, args)
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class ValueHolder { public data: string = 'default' }
function getData(this: ValueHolder): string { return this.data }
function setData(this: ValueHolder, d: string): void { this.data = d }
function testOrdinaryCallSyntax(): void {
  let vh: ValueHolder = new ValueHolder()
  setData(vh, 'updated')
  let result: string = getData(vh)
  console.log('compiled successfully')
}

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
 * @id EXP2_17_13_1_012_RUNTIME_METHOD_CALL_VERIFY
 * @expect runtime
 * @section 17.13.1
 * @design 运行时验证：方法调用语法 receiver.funcName(args) 正确执行并返回预期结果
 * @note 运行时用例：实际执行验证接收者函数的方法调用语法
 */
class NumberBox { public value: number = 0 }
function triple(this: NumberBox): number { return this.value * 3 }
function main(): void {
  let nb: NumberBox = new NumberBox(); nb.value = 7
  let r: number = nb.triple()
  if (r != 21) { throw new Error('assertion failed: expected 21, got ' + r) }
  console.log('verified')
}

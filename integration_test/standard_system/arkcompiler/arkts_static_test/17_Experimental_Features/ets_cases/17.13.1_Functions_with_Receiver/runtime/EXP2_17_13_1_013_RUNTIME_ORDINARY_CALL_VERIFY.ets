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
 * @id EXP2_17_13_1_013_RUNTIME_ORDINARY_CALL_VERIFY
 * @expect runtime
 * @section 17.13.1
 * @design 运行时验证：普通函数调用语法 funcName(receiver, args) 正确执行并返回预期结果
 * @note 运行时用例：实际执行验证接收者函数的普通调用语法
 */
class StringWrapper { public content: string = '' }
function appendExclamation(this: StringWrapper): string { return this.content + '!' }
function main(): void {
  let sw: StringWrapper = new StringWrapper(); sw.content = 'hello'
  let r: string = appendExclamation(sw)
  if (r != "hello!") { throw new Error("assertion failed: expected 'hello!', got '" + r + ''') }
  console.log('verified')
}

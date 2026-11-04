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
 * @id EXP2_17_13_3_005_PASS_CALL_VIA_FUNC_TYPE_VARIABLE
 * @expect compile-pass
 * @section 17.13.3
 * @design 通过函数类型变量以普通调用语法使用接收者函数
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Entry { public key: string = ''; public val: string = '' }
type EntryFormatter = (this: Entry) => string
function testCallViaVariable(): void {
  let formatter: EntryFormatter = (this: Entry): string => { return this.key + '=' + this.val }
  let e: Entry = new Entry(); e.key = 'name'; e.val = 'Alice'
  let formatted: string = formatter(e)
  console.log('compiled successfully')
}

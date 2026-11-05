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
 * @id EXP2_17_13_1_009_FAIL_THIS_NOT_FIRST_PARAM
 * @expect compile-fail
 * @section 17.13.1
 * @design 接收者函数的 this 参数必须是第一个参数，否则编译失败 ESY0158
 * @note 反向用例：验证该场景应产生编译时错误
 */
class MyTarget { public value: number = 0 }
function addWithPrefix(prefix: string, this: MyTarget): string { return prefix + this.value }
function testThisNotFirst(): void {
  let t: MyTarget = new MyTarget(); t.value = 42
  let result: string = t.addWithPrefix('val:')
}

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
 * @id EXP_07_27_03_003_FAIL_STRING_NUMBER
 * @expect compile-fail
 * @section 7.27.3
 * @design 验证string类型与number类型操作数不能直接用于关系运算符，应产生编译时错误
 *  * @note 反向用例：验证该场景应产生编译时错误
 */
function testStringNumber(): void {
  let s: string = 'hello'
  let n: number = 42
  let r: boolean = s > n  // compile-fail: string > number, incompatible
  console.log(r.toString())
}

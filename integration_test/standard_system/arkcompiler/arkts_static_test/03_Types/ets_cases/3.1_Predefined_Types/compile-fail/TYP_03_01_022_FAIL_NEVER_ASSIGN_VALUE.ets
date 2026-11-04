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
 * @id TYP_03_01_022_FAIL_NEVER_ASSIGN_VALUE
 * @expect compile-fail
 * @section 3.1
 * @design never 类型的非法使用应编译失败: 将值赋给 never、从 never 函数返回值、将非 never 变量赋给 never
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testNeverInvalidUseFail(): void {
  let n: never = 42
  n = "hello"
  n = null
  n = undefined
}

function returnNeverFail(): never {
  return 42
}

function impossibleAssignment(): void {
  let x: int = 1
  let n: never = x
}
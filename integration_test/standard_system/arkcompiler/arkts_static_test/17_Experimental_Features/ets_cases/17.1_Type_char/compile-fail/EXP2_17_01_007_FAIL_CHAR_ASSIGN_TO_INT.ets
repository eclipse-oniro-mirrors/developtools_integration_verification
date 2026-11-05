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
 * @id EXP2_17_01_007_FAIL_CHAR_ASSIGN_TO_INT
 * @expect compile-fail
 * @section 17.1
 * @design char 类型值不能隐式赋值给 int 类型，需要显式转换
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testCharAssignToIntFail(): void {
  let ch: char = c'A'
  let n: int = ch
  console.log(n)
}

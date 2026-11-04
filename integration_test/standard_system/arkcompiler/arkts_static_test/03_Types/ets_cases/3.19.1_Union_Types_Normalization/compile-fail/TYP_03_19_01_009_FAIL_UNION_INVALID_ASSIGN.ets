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
 * @id TYP_03_19_01_009_FAIL_UNION_INVALID_ASSIGN
 * @expect compile-fail
 * @section 3.19.1
 * @design union 归一化后仍不接受不在成员集合内的类型
 * @note 反向用例：number|string 不接受 boolean/Object
 */
type U9 = (number | string) | number

function testUnionInvalidAssignFail(): void {
  let u: U9 = true
  u = new Object()
}
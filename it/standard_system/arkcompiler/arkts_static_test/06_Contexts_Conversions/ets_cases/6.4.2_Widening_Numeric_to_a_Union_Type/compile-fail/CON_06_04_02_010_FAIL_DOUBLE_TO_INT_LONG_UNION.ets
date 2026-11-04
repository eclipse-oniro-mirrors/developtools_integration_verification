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
 * @id CON_06_04_02_010_FAIL_DOUBLE_TO_INT_LONG_UNION
 * @expect compile-fail
 * @section 6.4.2
 * @design double→int|long: 联合中无double或更大类型，应编译失败
 * @note 反向用例：float/double在无浮点成员的联合中失败
 */
function testDoubleToIntLongUnionFail(): void {
  let d: double = 3.14
  let u: int | long = d
}

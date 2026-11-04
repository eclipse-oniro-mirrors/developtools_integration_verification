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
 * @id EXP2_17_04_013_FAIL_ELEMENT_TYPE_MISMATCH
 * @expect compile-fail
 * @section 17.4
 * @design 元素类型不匹配：new int[3]("string") 中 string 不可赋值给 int，应产生编译时错误
 * @note 反向用例：验证 arrayElement 不可赋值给 arrayElementType 时触发编译时错误
 */
function testElementTypeMismatch(): void {
  let arr = new int[3]('string')
  console.log(arr.length)
}

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
 * @id EXP2_17_04_015_FAIL_BOOLEAN_DIMENSION
 * @expect compile-fail
 * @section 17.4
 * @design 布尔维度：new number[true](0) 维度为 boolean 类型，不可赋值给 int，应产生编译时错误
 * @note 反向用例：验证维度表达式类型为 boolean 时触发编译时错误
 */
function testBooleanDimension(): void {
  let x = new number[true](0)
  console.log(x.length)
}

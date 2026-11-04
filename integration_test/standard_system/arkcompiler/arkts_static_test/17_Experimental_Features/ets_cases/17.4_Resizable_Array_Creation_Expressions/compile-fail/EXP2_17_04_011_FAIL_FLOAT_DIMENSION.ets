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
 * @id EXP2_17_04_011_FAIL_FLOAT_DIMENSION
 * @expect compile-fail
 * @section 17.4
 * @design 浮点维度：new number[3.14](0) 维度为 double 字面量，不可赋值给 int，应产生编译时错误
 * @note 反向用例：验证非 int 维度的浮点常量触发编译时错误
 */
function testFloatDimension(): void {
  let x = new number[3.14](0)
  console.log(x.length)
}

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
 * @id EXP2_17_04_008_PASS_VARIABLE_DIMENSION
 * @expect compile-pass
 * @section 17.4
 * @design 变量维度：维度表达式为 int 类型变量，验证编译通过
 * @note 正向用例：验证维度可以使用 int 变量（编译时无法确定具体值但类型正确）
 */
function testVariableDimensionCreation(): void {
  let arraySize: int = 5
  let arr = new number[arraySize](0)
  console.log(arr.length)
}

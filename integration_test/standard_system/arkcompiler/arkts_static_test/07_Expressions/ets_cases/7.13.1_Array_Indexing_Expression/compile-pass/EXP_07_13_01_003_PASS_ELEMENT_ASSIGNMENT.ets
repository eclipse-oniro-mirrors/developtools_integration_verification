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
 * @id EXP_07_13_01_003_PASS_ELEMENT_ASSIGNMENT
 * @expect compile-pass
 * @section 7.13.1
 * @design 验证数组元素赋值：数组索引表达式结果是 T 类型变量
 * @note 正向用例：通过索引赋值修改数组元素，编译通过
 */
function main(): void {
  let names: string[] = ['Alice', 'Bob', 'Carol'];
  names[1] = 'Martin';
}

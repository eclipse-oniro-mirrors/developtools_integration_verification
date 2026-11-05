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
 * @id EXP_07_13_01_009_FAIL_FLOAT_LITERAL_INDEX
 * @expect compile-fail
 * @section 7.13.1
 * @design 验证非整数浮点字面量索引编译时错误：3.5 不是整数索引
 * @note 反向用例：an_array[3.5] double 字面量非整数索引，编译时错误
 */
function main(): void {
  let arr: int[] = [1, 2, 3];
  let elem: int = arr[3.5];
}

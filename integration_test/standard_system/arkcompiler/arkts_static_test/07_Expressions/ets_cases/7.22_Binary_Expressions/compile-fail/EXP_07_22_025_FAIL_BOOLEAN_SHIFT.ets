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
 * @id EXP_07_22_025_FAIL_BOOLEAN_SHIFT
 * @expect compile-fail
 * @section 7.22
 * @design 验证布尔右移 boolean >> int 产生编译时错误。
 *         类型组合表规定移位运算符仅支持数值类型和 bigint，
 *         boolean 不在其中。
 * @note 反向用例：布尔类型在移位运算符中应报编译时错误
 */
function main(): void {
  let a: boolean = true
  let b: int = 1
  let c = a >> b
}
main()

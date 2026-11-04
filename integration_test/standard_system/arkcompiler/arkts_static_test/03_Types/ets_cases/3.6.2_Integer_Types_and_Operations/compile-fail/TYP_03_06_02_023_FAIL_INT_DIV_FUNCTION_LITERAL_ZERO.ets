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
 * @id TYP_03_06_02_023_FAIL_INT_DIV_FUNCTION_LITERAL_ZERO
 * @expect compile-fail
 * @section 3.6.2
 * @design 函数体内字面量除以 0 应编译失败
 * @note 反向用例：编译期常量折叠检测除零
 */
function divLit(): int {
  return 10 / 0
}

function main(): void {
  let c: int = divLit()
  console.log(c)
}
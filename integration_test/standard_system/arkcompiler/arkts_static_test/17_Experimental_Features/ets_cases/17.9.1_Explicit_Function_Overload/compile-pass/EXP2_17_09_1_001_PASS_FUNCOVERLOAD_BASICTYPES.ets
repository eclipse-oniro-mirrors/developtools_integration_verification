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
 * @id EXP2_17_09_1_001_PASS_FUNCOVERLOAD_BASICTYPES
 * @expect compile-pass
 * @section 17.9.1
 * @design overload 函数重载：不同参数类型(int/string/boolean/double)
 * @note 正向用例：验证显式函数重载基本声明和调用
 */
function addInt(a: int, b: int): int {
  return a + b
}
function addStr(a: string, b: string): string {
  return a + b
}
function addDbl(a: double, b: double): double {
  return a + b
}
overload add { addInt, addStr, addDbl }

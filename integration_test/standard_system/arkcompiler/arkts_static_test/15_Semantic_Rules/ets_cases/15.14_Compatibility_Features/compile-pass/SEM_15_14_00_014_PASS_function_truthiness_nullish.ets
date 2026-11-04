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
/*
 * @id SEM_15_14_00_014_PASS_function_truthiness_nullish
 * @expect compile-pass
 * @section 15.14
 * @design 函数局部 truthiness 缩窄 nullish。
 * @note Generated one-to-one from test_design.
 */

function sem1514Pass020FunctionTruthinessNullish(): void {
  let value: int = 1
  value = value + 1
}


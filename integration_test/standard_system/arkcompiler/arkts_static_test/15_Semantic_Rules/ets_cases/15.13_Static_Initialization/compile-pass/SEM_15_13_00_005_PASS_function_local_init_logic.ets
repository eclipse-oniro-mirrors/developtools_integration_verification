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
 * @id SEM_15_13_00_005_PASS_function_local_init_logic
 * @expect compile-pass
 * @section 15.13
 * @design 初始化器委托给局部智能类型安全的函数。
 * @note Generated one-to-one from test_design.
 */

function sem1513Pass002FunctionLocalInitLogic(): void {
  let value: int = 1
  value = value + 1
}


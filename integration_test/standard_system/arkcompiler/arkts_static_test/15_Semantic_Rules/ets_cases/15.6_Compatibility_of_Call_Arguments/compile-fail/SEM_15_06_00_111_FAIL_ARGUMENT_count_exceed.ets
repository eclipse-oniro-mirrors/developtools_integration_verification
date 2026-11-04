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
 * @id SEM_15_06_00_111_FAIL_ARGUMENT_count_exceed
 * @expect compile-fail
 * @section 15.6
 * @design 规范 15.6：调用参数兼容性检查，参数数量不能超过参数数量
 * @note 测试参数数量超过参数数量（应该编译失败）
 */

// 测试参数数量超过参数数量（编译失败）
function add(a: number, b: number): number {
  return a + b
}

function testArgumentCountExceed(): void {
  // 编译失败：参数数量超过参数数量
  let result: number = add(1, 2, 3)  // Error: Expected 2 arguments, but got 3
}

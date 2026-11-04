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
 * @id SEM_15_11_00_115_FAIL_overload_no_match
 * @expect compile-fail
 * @section 15.11
 * @design 规范 15.11：无重载匹配时拒绝调用
 * @note 测试重载解析失败：没有重载接受实参类型（应该编译失败）
 */

// 测试重载无匹配（编译失败）
function f(x: int): void {}

function testOverloadNoMatch(): void {
  // 编译失败：boolean 不匹配任何重载
  f(true)  // Error: No overload matches
}

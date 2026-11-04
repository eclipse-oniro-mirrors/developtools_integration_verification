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
 * @id SEM_15_10_00_119_FAIL_overload_arg_type_mismatch
 * @expect compile-fail
 * @section 15.10
 * @design 规范 15.10：重载函数调用参数类型不匹配时拒绝
 * @note 测试重载调用时传入了不匹配的参数类型（应该编译失败）
 */

// 测试重载参数类型不匹配（编译失败）
function foo(x: int): void {}

function testOverloadArgMismatch(): void {
  // 编译失败：string 不匹配 int 参数
  foo('s')  // Error: No overload matches
}

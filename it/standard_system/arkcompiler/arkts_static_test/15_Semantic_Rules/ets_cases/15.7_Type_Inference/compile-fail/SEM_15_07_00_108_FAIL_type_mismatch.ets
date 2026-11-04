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
 * @id SEM_15_07_00_108_FAIL_type_mismatch
 * @expect compile-fail
 * @section 15.7
 * @design 规范 15.7：类型推断失败时拒绝赋值
 * @note 测试将 string 赋值给 int 类型变量（应该编译失败）
 */

// 测试类型推断不匹配（编译失败）
function testInferTypeMismatch(): void {
  // 编译失败：string 不能赋值给 int
  let x: int = 's'  // Error: Type 'string' is not assignable to type 'int'
}

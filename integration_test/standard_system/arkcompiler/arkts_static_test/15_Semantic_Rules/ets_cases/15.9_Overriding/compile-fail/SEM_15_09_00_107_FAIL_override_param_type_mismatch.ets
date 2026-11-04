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
 * @id SEM_15_09_00_107_FAIL_override_param_type_mismatch
 * @expect compile-fail
 * @section 15.9
 * @design 规范 15.9：覆写方法的参数类型必须与被覆写方法兼容
 * @note 测试参数类型不兼容的覆写（应该编译失败）
 */

// 测试参数类型不匹配的覆写（编译失败）
class B {
  f(x: int): void {}
}

class D extends B {
  // 编译失败：参数类型不兼容
  override f(x: string): void {}
}

function testOverrideParamMismatch(): void {}

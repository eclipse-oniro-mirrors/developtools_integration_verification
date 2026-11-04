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
 * @id SEM_15_13_00_105_FAIL_static_forward_ref
 * @expect compile-fail
 * @section 15.13
 * @design 规范 15.13：静态初始化中禁止前向引用
 * @note 测试静态字段前向引用未初始化的字段（应该编译失败）
 */

// 测试静态前向引用（编译失败）
class C {
  // 编译失败：b 尚未初始化
  public static a: int = C.b
  public static b: int = 1
}

function testStaticForwardRef(): void {}

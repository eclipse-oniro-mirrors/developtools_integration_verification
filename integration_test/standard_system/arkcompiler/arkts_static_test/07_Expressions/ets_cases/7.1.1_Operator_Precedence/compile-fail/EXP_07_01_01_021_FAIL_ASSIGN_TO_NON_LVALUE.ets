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
 * @id EXP_07_01_01_021_FAIL_ASSIGN_TO_NON_LVALUE
 * @expect compile-fail
 * @section 7.1.1
 * @design 加法 `+` 优先级高于赋值 `=`，`a + b = c` 被解析为 `(a + b) = c`，赋值给非左值
 * @note 反向用例：spec 要求报错，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 要求赋值给非左值应报 compile-time error，实现允许通过
 *       分类：D 类（Spec 与实现不一致）
 */
function testAssignToNonLvalue(): void {
  let a: int = 1
  let b: int = 2
  let c: int = 3
  a + b = c
}

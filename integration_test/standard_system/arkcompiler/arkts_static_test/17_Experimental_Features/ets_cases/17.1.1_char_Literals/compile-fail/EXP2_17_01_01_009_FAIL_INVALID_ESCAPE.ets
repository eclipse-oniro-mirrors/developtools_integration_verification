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
 * @id EXP2_17_01_01_009_FAIL_INVALID_ESCAPE
 * @expect compile-fail
 * @section 17.1.1
 * @design 非法转义序列 c'\q' 应产生编译时错误（spec: char 字面量只支持有效的转义序列）
 * @note 反向用例：spec 要求报错，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 要求非法转义序列报错，实现允许 c'\q' 编译通过
 *       分类：D 类（Spec 与实现不一致）
 */
function testInvalidEscapeFail(): void {
  let invalid: char = c'\q'
  console.log(invalid)
}

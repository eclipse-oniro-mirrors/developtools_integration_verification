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
 * @id EXP_07_02_01_011_PASS_EXPRESSION_STATEMENT
 * @expect compile-pass
 * @section 7.2.1
 * @design 函数调用作为独立表达式语句（standalone）
 * @note 正向用例：验证 standalone 表达式语句（函数调用）
 */
function sideEffect(): int {
  return 42
}

function testExpressionStatement(): void {
  sideEffect()
}

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
 * @id EXP_07_01_01_007_PASS_LOGICAL_AND_OR
 * @expect compile-pass
 * @section 7.1.1
 * @design 逻辑与 `&&` 优先级高于逻辑或 `||`，左结合
 * @note 正向用例：验证逻辑与优先于逻辑或
 */
function testLogicalAndOr(): void {
  let a: boolean = true || false && false
  let b: boolean = false && false || true
  let c: boolean = (true || false) && false
  let d: boolean = true || true && false || false
}

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
 * @id CON_06_03_007_PASS_CONDITIONAL_AND_OR
 * @expect compile-pass
 * @section 6.3
 * @design 条件与/条件或: boolean && boolean / boolean || boolean
 * @note 正向用例：验证 && 和 || 在数值上下文编译通过
 */
function testConditionalAndOr(): void {
  let a: int = 10
  let b: int = 20
  let r1: boolean = a < b && b > 0
  let r2: boolean = a > b || b < 30

  let x: boolean = true
  let y: boolean = false
  let r3: boolean = x && y
  let r4: boolean = x || y
}

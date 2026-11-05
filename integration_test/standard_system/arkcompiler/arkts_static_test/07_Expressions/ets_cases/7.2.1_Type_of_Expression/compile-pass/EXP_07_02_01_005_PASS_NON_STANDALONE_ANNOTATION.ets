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
 * @id EXP_07_02_01_005_PASS_NON_STANDALONE_ANNOTATION
 * @expect compile-pass
 * @section 7.2.1
 * @design non-standalone 显式类型注解，`let a: int = 42`，目标类型为 int
 * @note 正向用例：验证显式类型注解提供 target type
 */
function testNonStandaloneAnnotation(): void {
  let a: int = 42
  let b: string = 'hello'
  let c: boolean = true
  let d: double = 3.14
}

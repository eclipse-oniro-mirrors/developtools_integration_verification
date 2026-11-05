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
 * @id LEX_02_05_016_PASS_LITERAL_FLOAT
 * @expect compile-pass
 * @section 2.5
 * @design Literals Token: 浮点字面量
 * @note 正向用例：浮点字面量作为 Token
 */
function testLiteralFloat(): void {
  let pi: double = 3.14
  let e: double = 2.71
  let big: double = 1e10
  let small: double = 1.5e-5
  let f: float = 3.14f
}

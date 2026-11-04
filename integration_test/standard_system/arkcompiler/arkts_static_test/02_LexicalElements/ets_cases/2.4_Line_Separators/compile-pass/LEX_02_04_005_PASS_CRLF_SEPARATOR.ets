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
 * @id LEX_02_04_005_PASS_CRLF_SEPARATOR
 * @expect compile-pass
 * @section 2.4
 * @design CRLF (Windows 风格) 作为行分隔符序列
 * @note 正向用例：CRLF 应当被视为单一行分隔（"any sequence is single separator"）
 */
function testCrlf(): void {
  let a: int = 1
  let b: int = 2
  let c: int = a + b
}

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
 * @id LEX_02_04_006_PASS_LF_CRLF_MIX
 * @expect compile-pass
 * @section 2.4
 * @design 单文件内混合使用 LF 和 CRLF
 * @note 正向用例：LF + CRLF 混合编译通过
 */
function testLfCrlfMix(): void {
  let a: int = 1
  let b: int = 2
  let c: int = a + b
}

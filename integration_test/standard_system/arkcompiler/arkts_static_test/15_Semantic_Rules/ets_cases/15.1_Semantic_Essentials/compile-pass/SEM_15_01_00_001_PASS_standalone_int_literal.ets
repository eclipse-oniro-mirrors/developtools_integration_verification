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
 * @id SEM_15_01_00_001_PASS_standalone_int_literal
 * @expect compile-pass
 * @section 15.1
 * @design `let x = 1` 浣跨敤鏁存暟瀛楅潰閲忛粯璁ょ被鍨嬨€?
 * @note Generated one-to-one from test_design.
 */

function sem1501Pass001StandaloneIntLiteral(): void {
  let value: int = 1
  value = value + 1
}


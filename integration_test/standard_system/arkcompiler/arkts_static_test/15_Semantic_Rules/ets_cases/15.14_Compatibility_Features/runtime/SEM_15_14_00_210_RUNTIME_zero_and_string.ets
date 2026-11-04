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
 * @id SEM_15_14_00_210_RUNTIME_zero_and_string
 * @expect runtime
 * @section 15.14
 * @design `0 && "x"` 返回 0（&& 遇到 falsy 短路返回）。
 */

function main(): void {
  let result = 0 && 'x'
  arktest.assertEQ(result, 0)
}

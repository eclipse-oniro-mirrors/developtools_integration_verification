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
 * @id SEM_15_09_00_008_PASS_protected_to_public
 * @expect compile-pass
 * @section 15.9
 * @design 访问级别从 protected 放宽为 public。
 * @note Generated one-to-one from test_design.
 */

function sem1509Pass004ProtectedToPublic(): void {
  let value: int = 1
  value = value + 1
}


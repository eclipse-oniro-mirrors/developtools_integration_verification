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
 * @id SEM_15_07_00_006_PASS_return_same_type
 * @expect compile-pass
 * @section 15.7
 * @design 所有 return 路径类型一致。
 * @note Generated one-to-one from test_design.
 */

function sem1507Pass004ReturnSameType(): void {
  let value: int = 1
  value = value + 1
}


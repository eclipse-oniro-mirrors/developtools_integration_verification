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
 * @id SEM_15_13_00_006_PASS_ordered_static_fields
 * @expect compile-pass
 * @section 15.13
 * @design | 鍒濆鍖栧畨鍏?| Java 寰幆鍒濆鍖栦腑鍙兘鏆撮湶榛樿鍊笺€?| Swift 閫氳繃涓嶅悓瑙勫垯闃叉 use-before-init銆?|
 *    `SEM_15_13_00_006_PASS_ordered_static_fields` | `SEM_15_13_018_FAIL_static_forward_read` |
 * @note Generated one-to-one from test_design.
 */

function sem1513Pass020OrderedStaticFields(): void {
  let value: int = 1
}




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
 * @id SEM_15_11_00_009_PASS_broad_hides_narrow
 * @expect compile-pass
 * @section 15.11
 * @design 宽泛重载排在前导致窄重载不可达。
 * @note Generated one-to-one from test_design.
 */

function sem1511Warn002BroadHidesNarrow(x: Object): string {
  return 'WARN'
}


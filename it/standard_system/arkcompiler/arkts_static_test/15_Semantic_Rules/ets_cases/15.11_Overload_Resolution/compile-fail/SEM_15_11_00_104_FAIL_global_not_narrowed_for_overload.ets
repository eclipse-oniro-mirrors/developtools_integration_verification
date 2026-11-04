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
 * @id SEM_15_11_00_104_FAIL_global_not_narrowed_for_overload
 * @expect compile-fail
 * @section 15.11
 * @design 全局变量缩窄不应稳定影响重载选择。
 * @note Generated one-to-one from test_design.
 */

function sem1511Fail020GlobalNotNarrowedForOverload(): void {
  let value: string = 1
}


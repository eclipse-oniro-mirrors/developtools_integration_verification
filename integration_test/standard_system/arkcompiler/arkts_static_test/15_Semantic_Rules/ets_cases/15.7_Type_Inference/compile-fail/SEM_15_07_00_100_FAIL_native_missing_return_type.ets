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
 * @id SEM_15_07_00_100_FAIL_native_missing_return_type
 * @expect compile-fail
 * @section 15.7
 * @design native 函数缺少返回类型。
 * @note Generated one-to-one from test_design.
 */

function sem1507Fail001NativeMissingReturnType(): void {
  let value: string = 1
}


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
 * @id SEM_15_11_00_108_FAIL_ARCHIVE_no_matching_function
 * @expect compile-fail
 * @section 15.11
 * @design 归档吸纳：no matching function。来源 `Overloading\compile-fail\OVERLOAD_FAIL_001_no_matching_function.ets`；用于补充
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-fail\OVERLOAD_FAIL_001_no_matching_function.ets
 */

function overloadFail001Value(p: int): int {
  return p
}

function overloadFail001Value(p: string): string {
  return p
}

// @expect-error: ESE0127 No matching call signature for overloadFail001Value(Boolean)
let overloadFail001Result: int = overloadFail001Value(true)

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
 * @id SEM_15_10_00_109_FAIL_ARCHIVE_overload_name_same_as_function_not_listed
 * @expect compile-fail
 * @section 15.10
 * @design 归档吸纳：overload name same as function not listed。来源
 *  `Overloading\compile-fail\OVERLOAD_FAIL_007_overload_name_same_as_function_not_listed.ets`；用于补充
 *  `Overloading\compile-fail\OVERLOAD_FAIL_007_overload_name_same_as_function_not_listed.ets`；
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-fail\OVERLOAD_FAIL_007_overload_name_same_as_function_not_listed.ets
 */
function overloadFail007Call(p: int): int { return p}
function overloadFail007Other(p: string): string { return p}
// @expect-error: ESE0397 Method with the same name as overload declaration
//  'overloadFail007Call', overloadlist must list this medhod.
overload overloadFail007Call { overloadFail007Other }

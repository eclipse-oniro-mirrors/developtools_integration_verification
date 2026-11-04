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
 * @id SEM_15_10_00_108_FAIL_ARCHIVE_explicit_overload_implicit_name
 * @expect compile-fail
 * @section 15.10
 * @design 归档吸纳：explicit overload implicit name。来源
 *  `Overloading\compile-fail\OVERLOAD_FAIL_006_explicit_overload_implicit_name.ets`；用于补充
 *  `Overloading\compile-fail\OVERLOAD_FAIL_006_explicit_overload_implicit_name.ets`；
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-fail\OVERLOAD_FAIL_006_explicit_overload_implicit_name.ets
 */
function overloadFail006Value(p: int): int { return p}
function overloadFail006Value(p: string): string { return p}
function overloadFail006Other(p: boolean): boolean { return p}
// @expect-error: ESE0389 The overloaded name 'overloadFail006Value'
//  can't refer to a function with overload signatures.
overload overloadFail006Call { overloadFail006Value, overloadFail006Other }

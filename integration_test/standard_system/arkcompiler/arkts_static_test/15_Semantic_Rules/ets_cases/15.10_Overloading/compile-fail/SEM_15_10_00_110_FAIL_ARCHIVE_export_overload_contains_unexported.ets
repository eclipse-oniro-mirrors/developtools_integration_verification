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
 * @id SEM_15_10_00_110_FAIL_ARCHIVE_export_overload_contains_unexported
 * @expect compile-fail
 * @section 15.10
 * @design 归档吸纳：export overload contains unexported。来源
 *  `Overloading\compile-fail\OVERLOAD_FAIL_008_export_overload_contains_unexported.ets`；用于补充
 *  `Overloading\compile-fail\OVERLOAD_FAIL_008_export_overload_contains_unexported.ets`；
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-fail\OVERLOAD_FAIL_008_export_overload_contains_unexported.ets
 */
export function overloadFail008Exported(p: string): string { return p}
function overloadFail008Hidden(p: int): int { return p}
// @expect-error: ESE0456 The overload function must be exported along
//  because the overload alias is exported.
export overload overloadFail008Call { overloadFail008Exported, overloadFail008Hidden }

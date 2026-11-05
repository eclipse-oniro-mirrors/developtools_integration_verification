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
 * @id SEM_15_11_00_109_FAIL_ARCHIVE_return_type_not_used_for_resolution
 * @expect compile-fail
 * @section 15.11
 * @design 归档吸纳：return type not used for resolution。来源
 *  `Overloading\compile-fail\OVERLOAD_FAIL_003_return_type_not_used_for_resolution.ets`；用于补充
 *  `Overloading\compile-fail\OVERLOAD_FAIL_003_return_type_not_used_for_resolution.ets`；
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\
 *  compile-fail\OVERLOAD_FAIL_003_return_type_not_used_for_resolution.ets
 */
function overloadFail003Value(p: string): string { return p}
function overloadFail003Value(p: int): int { return p}
// @expect-error: ESE0318 Type 'String' cannot be assigned to type 'Int'
let overloadFail003Result: int = overloadFail003Value('ark')

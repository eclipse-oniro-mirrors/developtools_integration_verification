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
 * @id SEM_15_11_00_110_FAIL_ARCHIVE_constructor_no_matching
 * @expect compile-fail
 * @section 15.11
 * @design 归档吸纳：constructor no matching。来源
 *  `Overloading\compile-fail\OVERLOAD_FAIL_015_constructor_no_matching.ets`；用于补充
 *  `Overloading\compile-fail\OVERLOAD_FAIL_015_constructor_no_matching.ets`；
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-fail\OVERLOAD_FAIL_015_constructor_no_matching.ets
 */
class OverloadFail015Box { constructor() {} constructor(p: int) {}}
// @expect-error: ESE0127 No matching construct signature
//  for OVERLOAD_FAIL_015_constructor_no_matching.OverloadFail015Box("ark")
let overloadFail015Value: OverloadFail015Box = new OverloadFail015Box('ark')

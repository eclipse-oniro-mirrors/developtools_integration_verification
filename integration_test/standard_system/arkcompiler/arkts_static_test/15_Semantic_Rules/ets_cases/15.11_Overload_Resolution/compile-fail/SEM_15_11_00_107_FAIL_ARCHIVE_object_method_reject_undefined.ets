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
 *//* * @id SEM_15_11_00_107_FAIL_ARCHIVE_object_method_reject_undefined * @expect compile-fail * @section 15.11 * @design 归档吸纳：object method reject undefined。来源 *  `NullishOverloadResolution\compile-fail\SEM_FAIL_002_object_method_reject_undefined.ets`；用于补充   *  `NullishOverloadResolution\compile-fail\SEM_FAIL_002_object_method_reject_undefined.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\NullishOverloadResolution\compile-fail\SEM_FAIL_002_object_method_reject_undefined.ets */// @expect-error: Type 'undefined' cannot be assigned to parameter type 'Object'class SemFail002ObjectReceiver {  testedMethod(p: Object): void {}}function main(): void {  let c: SemFail002ObjectReceiver = new SemFail002ObjectReceiver()  c.testedMethod(undefined)
}
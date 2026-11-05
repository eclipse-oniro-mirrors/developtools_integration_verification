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
 *//* * @id SEM_15_11_00_112_FAIL_ARCHIVE_receiver_overload_method_call * @expect compile-fail * @section 15.11 * @design 归档吸纳：receiver overload method call。来源 *  `Overloading\compile-fail\OVERLOAD_FAIL_018_receiver_overload_method_call.ets`；用于补充   *  `Overloading\compile-fail\OVERLOAD_FAIL_018_receiver_overload_method_call.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-fail\OVERLOAD_FAIL_018_receiver_overload_method_call.ets */class OverloadFail018Receiver {}function overloadFail018Read(this: OverloadFail018Receiver): string {  return 'receiver'}function overloadFail018ReadString(this: OverloadFail018Receiver, p: string): string {  return p}overload overloadFail018Call { overloadFail018Read, overloadFail018ReadString }let overloadFail018Value: OverloadFail018Receiver = new OverloadFail018Receiver()// @expect-error: ESE0087 Property 'overloadFail018Call' does not exist on type 'OverloadFail018Receiver'let overloadFail018Result: string = overloadFail018Value.overloadFail018Call()
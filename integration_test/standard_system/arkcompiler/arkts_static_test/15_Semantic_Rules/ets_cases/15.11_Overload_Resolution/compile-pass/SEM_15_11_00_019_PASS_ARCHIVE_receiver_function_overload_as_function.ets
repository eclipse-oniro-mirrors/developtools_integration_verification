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
 *//* * @id SEM_15_11_00_019_PASS_ARCHIVE_receiver_function_overload_as_function * @expect compile-pass * @section 15.11 * @design 归档吸纳：receiver function overload as function。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_012_receiver_function_overload_as_function.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_012_receiver_function_overload_as_function.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_012_receiver_function_overload_as_function.ets */class OverloadPass012Receiver {}function overloadPass012Read(this: OverloadPass012Receiver): string {  return 'receiver'}function overloadPass012ReadValue(this: OverloadPass012Receiver, p: string): string {  return p}overload overloadPass012Call { overloadPass012Read, overloadPass012ReadValue }function main(): void {  let c: OverloadPass012Receiver = new OverloadPass012Receiver()  arktest.assertEQ(overloadPass012Call(c), 'receiver')  arktest.assertEQ(overloadPass012Call(c, 'ark'), 'ark')}
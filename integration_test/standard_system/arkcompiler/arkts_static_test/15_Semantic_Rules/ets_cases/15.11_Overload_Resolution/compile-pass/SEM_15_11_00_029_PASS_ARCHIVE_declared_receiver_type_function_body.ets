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
 *//* * @id SEM_15_11_00_029_PASS_ARCHIVE_declared_receiver_type_function_body * @expect compile-pass * @section 15.11 * @design 归档吸纳：declared receiver type function body。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_027_declared_receiver_type_function_body.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_027_declared_receiver_type_function_body.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_027_declared_receiver_type_function_body.ets */class OverloadPass027Base {  overload pick { pickNumber, pickString }  pickNumber(p: number): string {    return 'base-number'  }  pickString(p: string): string {    return 'base-string'  }}class OverloadPass027Derived extends OverloadPass027Base {  pickInt(p: int): string {    return 'derived-int'  }  overload pick { pickInt, pickNumber, pickString }}function main(): void {  let derived: OverloadPass027Derived = new OverloadPass027Derived()  let base: OverloadPass027Base = derived  arktest.assertEQ(derived.pick(27), 'derived-int')  // KNOWN_ISSUE: mainstream static language expectation is to use the declared receiver type  // OverloadPass027Base for overload resolution, so this should select pickNumber(number).  arktest.assertEQ(base.pick(27), 'base-number')}
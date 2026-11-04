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
 *//* * @id SEM_15_11_00_028_PASS_ARCHIVE_declared_receiver_type_top_level * @expect compile-pass * @section 15.11 * @design 归档吸纳：declared receiver type top level。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_026_declared_receiver_type_top_level.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_026_declared_receiver_type_top_level.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_026_declared_receiver_type_top_level.ets */class OverloadPass026Base {  overload pick { pickNumber, pickString }  pickNumber(p: number): string {    return 'base-number'  }  pickString(p: string): string {    return 'base-string'  }}class OverloadPass026Derived extends OverloadPass026Base {  pickInt(p: int): string {    return 'derived-int'  }  overload pick { pickInt, pickNumber, pickString }}let overloadPass026Derived: OverloadPass026Derived = new OverloadPass026Derived()let overloadPass026Base: OverloadPass026Base = overloadPass026Derivedarktest.assertEQ(overloadPass026Derived.pick(26), 'derived-int')arktest.assertEQ(overloadPass026Base.pick(26), 'base-number')
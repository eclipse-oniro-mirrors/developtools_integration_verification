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
 *//* * @id SEM_15_11_00_018_PASS_ARCHIVE_subclass_reorders_explicit_overload * @expect compile-pass * @section 15.11 * @design 归档吸纳：subclass reorders explicit overload。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_009_subclass_reorders_explicit_overload.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_009_subclass_reorders_explicit_overload.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_009_subclass_reorders_explicit_overload.ets */class OverloadPass009Base {  overload pick { pickNumber, pickString }  pickNumber(p: number): string {    return 'base-number'  }  pickString(p: string): string {    return 'base-string'  }}class OverloadPass009Derived extends OverloadPass009Base {  pickInt(p: int): string {    return 'derived-int'  }  overload pick { pickInt, pickNumber, pickString }}function main(): void {  let d: OverloadPass009Derived = new OverloadPass009Derived()  let b: OverloadPass009Base = d  arktest.assertEQ(d.pick(9), 'derived-int')  arktest.assertEQ(b.pick(9), 'base-number')}
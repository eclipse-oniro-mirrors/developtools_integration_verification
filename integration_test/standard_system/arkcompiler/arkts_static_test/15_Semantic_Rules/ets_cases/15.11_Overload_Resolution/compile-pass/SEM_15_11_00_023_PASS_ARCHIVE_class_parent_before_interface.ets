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
 *//* * @id SEM_15_11_00_023_PASS_ARCHIVE_class_parent_before_interface * @expect compile-pass * @section 15.11 * @design 归档吸纳：class parent before interface。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_021_class_parent_before_interface.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_021_class_parent_before_interface.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_021_class_parent_before_interface.ets */interface OverloadPass021I {  select(p: int): string {    return 'interface-int'  }}class OverloadPass021Base {  select(p: number): string {    return 'base-number'  }}class OverloadPass021Derived extends OverloadPass021Base implements OverloadPass021I {}function main(): void {  let v: OverloadPass021Derived = new OverloadPass021Derived()  arktest.assertEQ(v.select(21), 'base-number')}
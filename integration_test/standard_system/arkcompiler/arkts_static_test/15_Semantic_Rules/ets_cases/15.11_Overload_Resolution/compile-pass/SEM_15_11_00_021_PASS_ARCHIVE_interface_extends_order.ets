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
 *//* * @id SEM_15_11_00_021_PASS_ARCHIVE_interface_extends_order * @expect compile-pass * @section 15.11 * @design 归档吸纳：interface extends order。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_019_interface_extends_order.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_019_interface_extends_order.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_019_interface_extends_order.ets */interface OverloadPass019I1 {  select(p: number): string}interface OverloadPass019I2 {  select(p: int): string}interface OverloadPass019J extends OverloadPass019I1, OverloadPass019I2 {}class OverloadPass019Impl implements OverloadPass019J {  select(p: number): string {    return 'number'  }  select(p: int): string {    return 'int'  }}function main(): void {  let v: OverloadPass019J = new OverloadPass019Impl()  arktest.assertEQ(v.select(19), 'number')}
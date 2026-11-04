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
 *//* * @id SEM_15_11_00_025_PASS_ARCHIVE_overload_resolution_then_override_dispatch * @expect compile-pass * @section 15.11 * @design 归档吸纳：overload resolution then override dispatch。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_023_overload_resolution_then_override_dispatch.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_023_overload_resolution_then_override_dispatch.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_023_overload_resolution_then_override_dispatch.ets */class OverloadPass023C1 {}class OverloadPass023C2 extends OverloadPass023C1 {}class OverloadPass023A {  foo(c: OverloadPass023C2): string {    return 'A.C2'  }  foo(c: OverloadPass023C1): string {    return 'A.C1'  }}class OverloadPass023B extends OverloadPass023A {  override foo(c: OverloadPass023C2): string {    return 'B.C2'  }}function main(): void {  let a: OverloadPass023A = new OverloadPass023B()  arktest.assertEQ(a.foo(new OverloadPass023C2()), 'B.C2')  arktest.assertEQ(a.foo(new OverloadPass023C1()), 'A.C1')}
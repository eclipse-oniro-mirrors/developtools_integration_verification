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
 *//* * @id SEM_15_11_00_027_PASS_ARCHIVE_direct_supertypes_only * @expect compile-pass * @section 15.11 * @design 归档吸纳：direct supertypes only。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_025_direct_supertypes_only.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_025_direct_supertypes_only.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_025_direct_supertypes_only.ets */interface OverloadPass025I {  foo(p: string): string {    return 'interface-string'  }}class OverloadPass025Base implements OverloadPass025I {  foo(p: number): string {    return 'base-number'  }  foo(p: string): string {    return 'base-string'  }}class OverloadPass025Middle extends OverloadPass025Base {  foo(p: boolean): string {    return 'middle-boolean'  }}class OverloadPass025Derived extends OverloadPass025Middle {  foo(p: int): string {    return 'derived-int'  }}function main(): void {  let v: OverloadPass025Derived = new OverloadPass025Derived()  arktest.assertEQ(v.foo(25), 'derived-int')  arktest.assertEQ(v.foo(true), 'middle-boolean')  arktest.assertEQ(v.foo('ark'), 'base-string')}
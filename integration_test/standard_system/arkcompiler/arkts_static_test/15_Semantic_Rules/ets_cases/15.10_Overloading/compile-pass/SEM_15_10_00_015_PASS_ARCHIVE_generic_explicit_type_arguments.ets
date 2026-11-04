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
 *//* * @id SEM_15_10_00_015_PASS_ARCHIVE_generic_explicit_type_arguments * @expect compile-pass * @section 15.10 * @design 归档吸纳：generic explicit type arguments。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_005_generic_explicit_type_arguments.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_005_generic_explicit_type_arguments.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_005_generic_explicit_type_arguments.ets */function overloadPass005One<T>(p: T): string {  return 'one'}function overloadPass005Two<T, U = string>(p: T, q: U): string {  return 'two'}function overloadPass005Three<T, U = string, V = int>(p: T, q: U, r: V): string {  return 'three'}overload overloadPass005Pick { overloadPass005One, overloadPass005Two, overloadPass005Three }function main(): void {  arktest.assertEQ(overloadPass005Pick<int>(1), 'one')  arktest.assertEQ(overloadPass005Pick<int, string>(1, 'a'), 'two')  arktest.assertEQ(overloadPass005Pick<int, string, int>(1, 'a', 3), 'three')}
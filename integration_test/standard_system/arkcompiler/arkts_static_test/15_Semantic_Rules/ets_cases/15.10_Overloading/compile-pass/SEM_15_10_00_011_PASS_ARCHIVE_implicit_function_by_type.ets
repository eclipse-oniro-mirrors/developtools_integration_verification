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
 *//* * @id SEM_15_10_00_011_PASS_ARCHIVE_implicit_function_by_type * @expect compile-pass * @section 15.10 * @design 归档吸纳：implicit function by type。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_001_implicit_function_by_type.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_001_implicit_function_by_type.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_001_implicit_function_by_type.ets */function overloadPass001Value(p: int): int {  return p + 1}function overloadPass001Value(p: string): string {  return p + '_ok'}function main(): void {  arktest.assertEQ(overloadPass001Value(1), 2)  arktest.assertEQ(overloadPass001Value('ark'), 'ark_ok')}
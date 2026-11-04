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
 *//* * @id SEM_15_10_00_014_PASS_ARCHIVE_explicit_function_rest * @expect compile-pass * @section 15.10 * @design 归档吸纳：explicit function rest。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_004_explicit_function_rest.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_004_explicit_function_rest.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_004_explicit_function_rest.ets */function overloadPass004Two(a: int, b: int): int {  return a + b}function overloadPass004Many(...items: int[]): int {  let result: int = 0  for (let i: int = 0; i < items.length; i++) {    result += items[i]  }  return result}overload overloadPass004Sum { overloadPass004Two, overloadPass004Many }function main(): void {  arktest.assertEQ(overloadPass004Sum(1, 2), 3)  arktest.assertEQ(overloadPass004Sum(1, 2, 3), 6)}
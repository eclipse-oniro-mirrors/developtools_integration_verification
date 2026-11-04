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
 *//* * @id SEM_15_10_00_013_PASS_ARCHIVE_explicit_function_order * @expect compile-pass * @section 15.10 * @design 归档吸纳：explicit function order。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_003_explicit_function_order.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_003_explicit_function_order.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_003_explicit_function_order.ets */function overloadPass003Number(p: number): string {  return 'number'}function overloadPass003Int(p: int): string {  return 'int'}overload overloadPass003Select { overloadPass003Number, overloadPass003Int }function main(): void {  arktest.assertEQ(overloadPass003Select(1), 'number')  arktest.assertEQ(overloadPass003Int(1), 'int')}
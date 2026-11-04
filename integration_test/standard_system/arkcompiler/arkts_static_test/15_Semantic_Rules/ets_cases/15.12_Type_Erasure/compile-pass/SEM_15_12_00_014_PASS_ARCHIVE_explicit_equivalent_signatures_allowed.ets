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
 *//* * @id SEM_15_12_00_014_PASS_ARCHIVE_explicit_equivalent_signatures_allowed * @expect compile-pass * @section 15.12 * @design 归档吸纳：explicit equivalent signatures allowed。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_014_explicit_equivalent_signatures_allowed.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_014_explicit_equivalent_signatures_allowed.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_014_explicit_equivalent_signatures_allowed.ets */function overloadPass014StringArray(p: string[]): string {  return 'string:' + p[0]}function overloadPass014IntArray(p: int[]): string {  return 'int:' + p[0].toString()
}overload overloadPass014Select { overloadPass014StringArray, overloadPass014IntArray }function main(): void {  let strings: string[] = ['ark']  let ints: int[] = [14]  arktest.assertEQ(overloadPass014Select(strings), 'string:ark')  arktest.assertEQ(overloadPass014Select(ints), 'int:14')}
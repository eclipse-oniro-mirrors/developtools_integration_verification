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
 *//* * @id SEM_15_12_00_013_PASS_ARCHIVE_different_arity_not_equivalent * @expect compile-pass * @section 15.12 * @design 归档吸纳：different arity not equivalent。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_013_different_arity_not_equivalent.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_013_different_arity_not_equivalent.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_013_different_arity_not_equivalent.ets */function overloadPass013Value(p: int): string {  return 'one:' + p.toString()
}function overloadPass013Value(p: int, q: int): string {  return 'two:' + (p + q).toString()
}function main(): void {  arktest.assertEQ(overloadPass013Value(1), 'one:1')  arktest.assertEQ(overloadPass013Value(1, 2), 'two:3')}
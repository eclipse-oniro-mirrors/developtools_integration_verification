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
 *//* * @id SEM_15_10_00_018_PASS_ARCHIVE_interface_overload_inherited_by_class * @expect compile-pass * @section 15.10 * @design 归档吸纳：interface overload inherited by class。来源 *  `Overloading\compile-pass\OVERLOAD_PASS_008_interface_overload_inherited_by_class.ets`；用于补充   *  `Overloading\compile-pass\OVERLOAD_PASS_008_interface_overload_inherited_by_class.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_008_interface_overload_inherited_by_class.ets */interface OverloadPass008I {  readInt(p: int): string  readString(p: string): string  overload read { readInt, readString }}class OverloadPass008Impl implements OverloadPass008I {  readInt(p: int): string {    return 'int:' + p.toString()
}  readString(p: string): string {    return 'string:' + p  }}function main(): void {  let v: OverloadPass008I = new OverloadPass008Impl()  arktest.assertEQ(v.read(8), 'int:8')  arktest.assertEQ(v.read('ark'), 'string:ark')}
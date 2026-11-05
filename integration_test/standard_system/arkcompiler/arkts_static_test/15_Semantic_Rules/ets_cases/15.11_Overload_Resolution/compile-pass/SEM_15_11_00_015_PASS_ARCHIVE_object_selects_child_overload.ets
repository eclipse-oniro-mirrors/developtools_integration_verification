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
 *//* * @id SEM_15_11_00_015_PASS_ARCHIVE_object_selects_child_overload * @expect compile-pass * @section 15.11 * @design 归档吸纳：object selects child overload。来源 *  `NullishOverloadResolution\compile-pass\SEM_PASS_004_object_selects_child_overload.ets`；用于补充   *  `NullishOverloadResolution\compile-pass\SEM_PASS_004_object_selects_child_overload.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\NullishOverloadResolution\compile-pass\SEM_PASS_004_object_selects_child_overload.ets */class SemPass004Parent {  public res: int = 0  testedMethod<A>(p: A): SemPass004Parent {    this.res = 1    return new SemPass004Parent()  }}class SemPass004Child extends SemPass004Parent {  testedMethod(p: Object): SemPass004Child {    this.res = 2    return new SemPass004Child()  }}function main(): void {  let c: SemPass004Child = new SemPass004Child()  c.testedMethod({})  arktest.assertTrue(c.res == 2)
}
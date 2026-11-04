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
 *//* * @id SEM_15_11_00_017_PASS_ARCHIVE_parent_static_type_null_keeps_parent_generic * @expect compile-pass * @section 15.11 * @design 归档吸纳：parent static type null keeps parent generic。来源 *  `NullishOverloadResolution\compile-pass\SEM_PASS_006_parent_static_type_null_keeps_parent_generic.ets`；用于补充   *  `NullishOverloadResolution\compile-pass\SEM_PASS_006_parent_static_type_null_keeps_parent_generic.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\NullishOverloadResolution\compile-pass\SEM_PASS_006_parent_static_type_null_keeps_parent_generic.ets */class SemPass006Parent {  public res: int = 0  testedMethod<A>(p: A): SemPass006Parent {    this.res = 1    return new SemPass006Parent()  }}class SemPass006Child extends SemPass006Parent {  testedMethod(p: Object): SemPass006Child {    this.res = 2    return new SemPass006Child()  }}function main(): void {  let c: SemPass006Child = new SemPass006Child()  let p: SemPass006Parent = c  p.testedMethod(null)  arktest.assertTrue(c.res == 1)
}
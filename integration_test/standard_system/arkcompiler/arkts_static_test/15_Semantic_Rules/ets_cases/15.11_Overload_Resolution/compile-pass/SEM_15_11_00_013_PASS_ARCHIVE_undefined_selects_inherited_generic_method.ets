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
 *//* * @id SEM_15_11_00_013_PASS_ARCHIVE_undefined_selects_inherited_generic_method * @expect compile-pass * @section 15.11 * @design 归档吸纳：undefined selects inherited generic method。来源 *  `NullishOverloadResolution\compile-pass\SEM_PASS_002_undefined_selects_inherited_generic_method.ets`；用于补充   *  `NullishOverloadResolution\compile-pass\SEM_PASS_002_undefined_selects_inherited_generic_method.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\NullishOverloadResolution\compile-pass\SEM_PASS_002_undefined_selects_inherited_generic_method.ets */class SemPass002Parent {  public res: int = 0  testedMethod<A>(p: A): SemPass002Parent {    this.res = 1    return new SemPass002Parent()  }}class SemPass002Child extends SemPass002Parent {  testedMethod(p: Object): SemPass002Child {    this.res = 2    return new SemPass002Child()  }}function main(): void {  let c: SemPass002Child = new SemPass002Child()  c.testedMethod(undefined)  arktest.assertTrue(c.res == 1)
}
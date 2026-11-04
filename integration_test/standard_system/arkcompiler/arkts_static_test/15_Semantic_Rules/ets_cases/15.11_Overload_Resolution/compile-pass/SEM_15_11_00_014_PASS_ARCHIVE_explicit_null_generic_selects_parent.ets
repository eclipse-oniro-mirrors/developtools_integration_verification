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
 *//* * @id SEM_15_11_00_014_PASS_ARCHIVE_explicit_null_generic_selects_parent * @expect compile-pass * @section 15.11 * @design 归档吸纳：explicit null generic selects parent。来源 *  `NullishOverloadResolution\compile-pass\SEM_PASS_003_explicit_null_generic_selects_parent.ets`；用于补充   *  `NullishOverloadResolution\compile-pass\SEM_PASS_003_explicit_null_generic_selects_parent.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\NullishOverloadResolution\compile-pass\SEM_PASS_003_explicit_null_generic_selects_parent.ets */class SemPass003Parent {  public res: int = 0  testedMethod<A>(p: A): SemPass003Parent {    this.res = 1    return new SemPass003Parent()  }}class SemPass003Child extends SemPass003Parent {  testedMethod(p: Object): SemPass003Child {    this.res = 2    return new SemPass003Child()  }}function main(): void {  let c: SemPass003Child = new SemPass003Child()  c.testedMethod<null>(null)  arktest.assertTrue(c.res == 1)
}
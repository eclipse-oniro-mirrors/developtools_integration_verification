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
 */
/**
 * @id SEM_15_11_00_234_RUNTIME_ARCHIVE_explicit_null_generic_selects_parent
 * @expect runtime
 * @section 15.11
 * @design 归档吸纳：explicit null generic selects parent。来源
 *  `NullishOverloadResolution\runtime\SEM_RT_003_explicit_null_generic_selects_parent.ets`；用于补充
 *  `NullishOverloadResolution\runtime\SEM_RT_003_explicit_null_generic_selects_parent.ets`；
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\
 *  NullishOverloadResolution\runtime\SEM_RT_003_explicit_null_generic_selects_parent.ets
 */
// Expected runtime: 1
class SemRt003Parent {
  public res: int = 0
  testedMethod<A>(p: A): SemRt003Parent {
    this.res = 1
    return new SemRt003Parent()
  }
}
class SemRt003Child extends SemRt003Parent {
  testedMethod(p: Object): SemRt003Child {
    this.res = 2
    return new SemRt003Child()
  }
}
let c: SemRt003Child = new SemRt003Child()
c.testedMethod<null>(null)
console.info(`${c.res}`)
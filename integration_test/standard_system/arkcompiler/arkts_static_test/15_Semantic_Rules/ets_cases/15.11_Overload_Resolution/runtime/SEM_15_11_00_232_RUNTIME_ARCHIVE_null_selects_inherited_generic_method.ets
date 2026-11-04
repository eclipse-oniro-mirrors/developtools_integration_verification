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
 * @id SEM_15_11_00_232_RUNTIME_ARCHIVE_null_selects_inherited_generic_method
 * @expect runtime
 * @section 15.11
 * @design 归档吸纳：null selects inherited generic method。来源
 *  `NullishOverloadResolution\runtime\SEM_RT_001_null_selects_inherited_generic_method.ets`；用于补充
 *  `NullishOverloadResolution\runtime\SEM_RT_001_null_selects_inherited_generic_method.ets`；
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\
 *  NullishOverloadResolution\runtime\SEM_RT_001_null_selects_inherited_generic_method.ets
 */
// Expected runtime: 1
class SemRt001Parent {
  public res: int = 0
  testedMethod<A>(p: A): SemRt001Parent {
    this.res = 1
    return new SemRt001Parent()
  }
}
class SemRt001Child extends SemRt001Parent {
  testedMethod(p: Object): SemRt001Child {
    this.res = 2
    return new SemRt001Child()
  }
}
let c: SemRt001Child = new SemRt001Child()
c.testedMethod(null)
console.info(`${c.res}`)
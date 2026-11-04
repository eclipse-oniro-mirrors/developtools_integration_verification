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
 * @id SEM_15_11_00_236_RUNTIME_ARCHIVE_parent_static_type_keeps_parent_generic
 * @expect runtime
 * @section 15.11
 * @design 归档吸纳：parent static type keeps parent generic。来源
 *  `NullishOverloadResolution\runtime\SEM_RT_005_parent_static_type_keeps_parent_generic.ets`；用于补充
 *  `NullishOverloadResolution\runtime\SEM_RT_005_parent_static_type_keeps_parent_generic.ets`；
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\
 *  NullishOverloadResolution\runtime\SEM_RT_005_parent_static_type_keeps_parent_generic.ets
 */
// Expected runtime: 1
class SemRt005Parent {
  public res: int = 0
  testedMethod<A>(p: A): SemRt005Parent {
    this.res = 1
    return new SemRt005Parent()
  }
}
class SemRt005Child extends SemRt005Parent {
  testedMethod(p: Object): SemRt005Child {
    this.res = 2
    return new SemRt005Child()
  }
}
let c: SemRt005Child = new SemRt005Child()
let p: SemRt005Parent = c
p.testedMethod({})
console.info(`${c.res}`)
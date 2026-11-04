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
 *//* * @id SEM_15_10_00_113_FAIL_ARCHIVE_non_static_overload_static_method * @expect compile-fail * @section 15.10 * @design 归档吸纳：non static overload static method。来源 *  `Overloading\compile-fail\OVERLOAD_FAIL_011_non_static_overload_static_method.ets`；用于补充   *  `Overloading\compile-fail\OVERLOAD_FAIL_011_non_static_overload_static_method.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-fail\OVERLOAD_FAIL_011_non_static_overload_static_method.ets */class OverloadFail011Class {  static readInt(p: int): int {    return p  }  readString(p: string): string {    return p  }  // @expect-error: ESE0387 Overload alias and overloaded method name must have exactly the same modifiers (static, async).  overload read { readInt, readString }}
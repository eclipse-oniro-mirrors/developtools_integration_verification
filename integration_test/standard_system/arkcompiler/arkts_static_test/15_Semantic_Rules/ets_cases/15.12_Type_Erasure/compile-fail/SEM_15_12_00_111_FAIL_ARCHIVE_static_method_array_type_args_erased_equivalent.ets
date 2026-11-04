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
 *//* * @id SEM_15_12_00_111_FAIL_ARCHIVE_static_method_array_type_args_erased_equivalent * @expect compile-fail * @section 15.12 * @design 归档吸纳：static method array type args erased equivalent。来源 *  `Overloading\compile-fail\OVERLOAD_FAIL_022_static_method_array_type_args_erased_equivalent.ets`；用于补充   *  `Overloading\compile-fail\OVERLOAD_FAIL_022_static_method_array_type_args_erased_equivalent.ets`；
    *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-fail\OVERLOAD_FAIL_022_static_method_array_type_args_erased_equivalent.ets */class OverloadFail022Box {  static read(p: string[]): string {    return p[0]  }  // @expect-error: ESE0131 Function read with this assembly signature already declared.  static read(p: int[]): int {    return p[0]  }}
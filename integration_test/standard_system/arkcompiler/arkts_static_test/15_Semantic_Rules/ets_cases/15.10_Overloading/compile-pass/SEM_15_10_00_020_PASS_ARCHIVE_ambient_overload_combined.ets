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
/*
 * @id SEM_15_10_00_020_PASS_ARCHIVE_ambient_overload_combined
 * @expect compile-pass
 * @section 15.10
 * @design Archive import: ambient overload declarations are accepted and form callable overload sets in ambient
 *  type checking.
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_011_ambient_overload_combined.ets
 */

export declare function overloadPass011String(p: string): string
export declare function overloadPass011Int(p: int): int
export declare overload overloadPass011Value { overloadPass011String, overloadPass011Int }

export declare class OverloadPass011Class {
  readString(p: string): string
  readInt(p: int): int
  overload read { readString, readInt }
}


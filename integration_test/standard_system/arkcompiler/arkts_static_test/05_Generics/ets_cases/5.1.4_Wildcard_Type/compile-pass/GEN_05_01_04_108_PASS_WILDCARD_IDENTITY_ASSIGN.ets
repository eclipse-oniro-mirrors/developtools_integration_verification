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
 * @id GEN_05_01_04_108_PASS_WILDCARD_IDENTITY_ASSIGN
 * @expect compile-pass
 * @section 5.1.4
 * @design 涓や釜instanceof鎺ㄦ柇鐨刋<*>绫诲瀷鍙簰鐩歌祴鍊? * @note spec_original: a1=a2 OK as X<*> and X<*> are identical
 */
class X108<T> {
  public p: T;
  constructor(v: T) { this.p = v }
}
function foo108(a: Any, b: Any): void {
  if (a instanceof X108 && b instanceof X108) {
    let a1 = a
    let a2 = b
    a1 = a2
  }
}
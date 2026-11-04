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
 * @id GEN_05_02_02_007_PASS_PARTIAL_INST_FIELD
 * @expect compile-pass
 * @section 5.2.2
 * @design 瀛楁绫诲瀷涓殑partial instantiation
 * @note spec: f1: X<Object, T>, f2: X<T, string>
 */
class X007<T1, T2> {}
class Z007<T> {
  public f1: X007<Object, T>
  public f2: X007<T, string>
  constructor() { this.f1 = new X007<Object, T>(); this.f2 = new X007<T, string>() }
}
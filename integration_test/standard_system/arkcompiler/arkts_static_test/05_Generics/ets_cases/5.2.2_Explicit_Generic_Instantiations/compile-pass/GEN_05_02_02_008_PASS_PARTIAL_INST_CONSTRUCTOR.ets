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
 * @id GEN_05_02_02_008_PASS_PARTIAL_INST_CONSTRUCTOR
 * @expect compile-pass
 * @section 5.2.2
 * @design 构造函数中new表达式的partial instantiation
 * @note spec: new X<Object,T>, new X<T,string>
 */
class X008<T1, T2> {}
class Z008<T> {
  public f1: X008<Object, T>
  public f2: X008<T, string>
  constructor() { this.f1 = new X008<Object, T>(); this.f2 = new X008<T, string>() }
}
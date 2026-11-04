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
 * @id GEN_05_02_02_005_PASS_PARTIAL_INST_GENERIC
 * @expect compile-pass
 * @section 5.2.2
 * @design 部分实例化产生新泛型
 * @note 正向用例：验证部分实例化产生新泛型实体
 */
class X<T1, T2> {}
class Y<T> extends X<number, T> {
    f1: X<Object, T>;
    f2: X<T, string>;
    constructor() { super(); this.f1 = new X<Object, T>(); this.f2 = new X<T, string>(); }
}

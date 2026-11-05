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
 * @id GEN_05_01_01_006_PASS_CONSTRAINT_DERIVED
 * @expect compile-pass
 * @section 5.1.1
 * @design 子类型通过联合约束（Derived extends Base，满足Base|SomeType）
 * @note 正向用例：验证 H<Derived> 满足 extends Base|SomeType 约束编译通过（spec 5.1.1 行139）
 */
class Base {}
class Derived extends Base {}
class SomeType {}
class H<T extends Base | SomeType> {}
let h2 = new H<Derived>

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
 * @id GEN_05_01_02_004_PASS_DEFAULT_EQUIV
 * @expect compile-pass
 * @section 5.1.2
 * @design 默认值的语义等价
 * @note 正向用例：验证省略默认参数与显式指定等价
 */
class SomeType {}
interface Interface<T = SomeType> {}
class Base_2<T = SomeType> {}
class Derived1 extends Base_2 implements Interface {}
class Derived2 extends Base_2<SomeType> implements Interface<SomeType> {}

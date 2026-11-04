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
 * @id GEN_05_01_01_005_PASS_DEPENDENT_PARAM
 * @expect compile-pass
 * @section 5.1.1
 * @design 依赖前一个类型参数
 * @note 正向用例：验证类型参数依赖前一个参数
 */
class Base {}
class Derived extends Base {}
class G<T, S extends T> {}
let x: G<Base, Derived>;

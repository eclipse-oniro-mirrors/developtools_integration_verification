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
 * @id CLS_09_10_020_PASS_OVERRIDE_WITH_COVARIANT
 * @expect compile-pass
 * @section 9.10
 * @design override协变返回类型
 * @note 正向用例
 */
class Animal20 {}
class Dog20 extends Animal20 {}
class Base20 { getPet(): Animal20 { return new Animal20() } }
class Child20 extends Base20 { override getPet(): Dog20 { return new Dog20() } }

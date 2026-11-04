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
 * @id CLS_09_10_021_FAIL_OVERRIDE_NON_COVARIANT
 * @expect compile-fail
 * @section 9.10
 * @design override返回非协变类型
 * @note 反向用例
 */
class Animal21 {}
class Plant21 {}
class Base21 { getThing(): Animal21 { return new Animal21() } }
class Bad21 extends Base21 { override getThing(): Plant21 { return new Plant21() } }

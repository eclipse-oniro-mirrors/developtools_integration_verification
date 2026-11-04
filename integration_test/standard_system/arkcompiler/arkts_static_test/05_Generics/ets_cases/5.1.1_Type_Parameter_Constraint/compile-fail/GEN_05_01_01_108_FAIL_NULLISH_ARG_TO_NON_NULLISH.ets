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
 * @id GEN_05_01_01_108_FAIL_NULLISH_ARG_TO_NON_NULLISH
 * @expect compile-fail
 * @section 5.1.1
 * @design non-nullish约束传播：T extends Base时T不能是null/undefined
 * @note spec: if constraint is non-nullish, T is also non-nullish
 */
class Base108 {}
class G108<T extends Base108> {}
let g108: G108<undefined>
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
 * @id GEN_05_02_02_100_FAIL_NON_GENERIC_WITH_ARGS
 * @expect compile-fail
 * @section 5.2.2
 * @design 非泛型实体提供类型参数
 * @note 反向用例：验证非泛型类型不能有类型参数
 */
class NonGeneric {}
let x: NonGeneric<number>;

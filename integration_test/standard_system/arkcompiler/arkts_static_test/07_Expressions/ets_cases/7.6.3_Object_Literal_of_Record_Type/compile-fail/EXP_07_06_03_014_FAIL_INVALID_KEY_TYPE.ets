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
 * @id EXP_07_06_03_014_FAIL_INVALID_KEY_TYPE
 * @expect compile-fail
 * @section 7.6.3
 * @design Key 类型不合法：Record<boolean, number> 中 boolean 不是合法的 Key 类型，应编译时错误
 * @note 反向用例：验证 Record 的 Key 只能是数值类型、string、字符串字面量、或这些的 union
 */
let map: Record<boolean, number> = {}

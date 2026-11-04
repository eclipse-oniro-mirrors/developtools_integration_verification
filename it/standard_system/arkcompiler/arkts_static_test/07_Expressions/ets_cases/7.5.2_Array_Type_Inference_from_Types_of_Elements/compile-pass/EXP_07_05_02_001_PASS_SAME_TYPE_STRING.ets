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
 * @id EXP_07_05_02_001_PASS_SAME_TYPE_STRING
 * @expect compile-pass
 * @section 7.5.2
 * @design 所有元素同类型 string：let b = ["a"] 推断为 string[]
 * @note 正向用例：验证相同类型 T 推断为 T[]，单一元素也成立
 */
let b = ['a']

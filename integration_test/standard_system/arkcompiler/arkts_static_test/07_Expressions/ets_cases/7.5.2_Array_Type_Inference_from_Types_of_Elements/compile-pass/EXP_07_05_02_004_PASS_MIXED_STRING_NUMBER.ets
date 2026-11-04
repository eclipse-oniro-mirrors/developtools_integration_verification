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
 * @id EXP_07_05_02_004_PASS_MIXED_STRING_NUMBER
 * @expect compile-pass
 * @section 7.5.2
 * @design 混合 string + number 类型：let e = ["a" + "b", 1, 3.14] 推断为 (string | number)[]
 * @note 正向用例：验证混合类型推断为 union 数组
 */
let e = ['a' + 'b', 1, 3.14]

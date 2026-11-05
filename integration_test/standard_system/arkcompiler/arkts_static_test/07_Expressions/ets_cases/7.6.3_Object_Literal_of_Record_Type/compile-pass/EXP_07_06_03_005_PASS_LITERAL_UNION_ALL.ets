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
 * @id EXP_07_06_03_005_PASS_LITERAL_UNION_ALL
 * @expect compile-pass
 * @section 7.6.3
 * @design 字面量 union Key 所有变体均列出：Record<"aa"|"bb", number> 提供 aa 和 bb
 * @note 正向用例：验证字面量 union Key 的所有变体均提供时合法
 */
let map: Record<'aa' | 'bb', number> = {
    'aa': 1,
    'bb': 2,
}

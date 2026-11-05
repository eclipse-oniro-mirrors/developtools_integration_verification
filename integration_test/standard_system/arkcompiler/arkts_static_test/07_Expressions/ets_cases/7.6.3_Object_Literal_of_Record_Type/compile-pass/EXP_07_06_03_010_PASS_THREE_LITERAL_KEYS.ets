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
 * @id EXP_07_06_03_010_PASS_THREE_LITERAL_KEYS
 * @expect compile-pass
 * @section 7.6.3
 * @design Record 字面量 union Key 三个变体全部列出：Record<"x"|"y"|"z", string>
 * @note 正向用例：验证三个变体的字面量 union Key 全部提供时合法
 */
let map: Record<'x' | 'y' | 'z', string> = {
    'x': 'first',
    'y': 'second',
    'z': 'third',
}

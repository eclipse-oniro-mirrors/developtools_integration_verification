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
 * @id EXP_07_06_03_011_FAIL_MISSING_LITERAL_KEY
 * @expect compile-fail
 * @section 7.6.3
 * @design 字面量 union Key 缺少变体：Record<"aa"|"bb", number> 只提供 "aa"，缺少 "bb"，应编译时错误
 * @note 反向用例：验证字面量 union Key 的所有变体必须在 Record 字面量中列出
 */
let map: Record<'aa' | 'bb', number> = {
    'aa': 1,
}

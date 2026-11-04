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
 * @id EXP_07_06_03_007_PASS_TRAILING_COMMA
 * @expect compile-pass
 * @section 7.6.3
 * @design Record 字面量尾部逗号
 * @note 正向用例：验证 Record 字面量最后条目后允许尾部逗号
 */
let map: Record<string, number> = {
    'a': 1,
    'b': 2,
}

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
 * @id EXP_07_06_03_012_FAIL_KEY_TYPE_MISMATCH
 * @expect compile-fail
 * @section 7.6.3
 * @design Key 类型不兼容：Record<string, number> 提供数值键 1（应为 string），应编译时错误
 * @note 反向用例：验证 Record 字面量的 key 表达式类型必须兼容 Key 类型
 */
let map: Record<string, number> = {
    1: 42,
}

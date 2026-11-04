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
 * @id EXP_07_06_02_010_PASS_GETTER_ONLY_PROP
 * @expect compile-pass
 * @section 7.6.2
 * @design Getter-only 属性：接口只有 getter，对象字面量创建只读字段（始终返回字面量值）
 * @note 正向用例：验证 getter-only 属性的对象字面量创建合法
 */
interface I2 {
    get attr(): number
}
const i2: I2 = {attr: 42}

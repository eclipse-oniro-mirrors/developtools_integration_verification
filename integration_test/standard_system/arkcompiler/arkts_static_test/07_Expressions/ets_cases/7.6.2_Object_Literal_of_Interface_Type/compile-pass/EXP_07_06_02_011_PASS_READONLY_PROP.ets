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
 * @id EXP_07_06_02_011_PASS_READONLY_PROP
 * @expect compile-pass
 * @section 7.6.2
 * @design Readonly 属性：接口中 readonly 属性，对象字面量创建只读字段
 * @note 正向用例：验证 readonly 属性的对象字面量创建合法（同 getter-only）
 */
interface I3 {
    public readonly attr: number
}
const i3: I3 = {attr: 42}

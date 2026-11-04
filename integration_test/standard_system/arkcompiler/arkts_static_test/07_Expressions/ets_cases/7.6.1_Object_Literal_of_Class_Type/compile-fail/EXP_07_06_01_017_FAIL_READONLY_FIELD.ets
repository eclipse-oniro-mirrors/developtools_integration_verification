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
 * @id EXP_07_06_01_017_FAIL_READONLY_FIELD
 * @expect compile-fail
 * @section 7.6.1
 * @design 对象字面量显式设置 readonly 字段：field2 为 readonly，{field1: 654, field2: 3} 应为编译时错误
 * @note 反向用例：验证不能通过对象字面量显式设置 readonly 字段
 */
class C {
    public field1 = 123
    public readonly field2: number
    constructor() {
    }
}
let d: C = { field1: 654, field2: 3 }

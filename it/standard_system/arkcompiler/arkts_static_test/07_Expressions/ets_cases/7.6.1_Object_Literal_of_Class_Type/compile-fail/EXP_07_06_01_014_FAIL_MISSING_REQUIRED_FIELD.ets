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
 * @id EXP_07_06_01_014_FAIL_MISSING_REQUIRED_FIELD
 * @expect compile-fail
 * @section 7.6.1
 * @design 无默认值/初始化器的字段未提供：f1: Object 为引用类型无默认值也未提供值，应为编译时错误
 * @note 反向用例：验证无默认值也无初始化器的字段在对象字面量中必须提供
 */
class C {
    public f1: Object
    public f2: string = 'hello'
}
let c: C = {f2: 'hello'}

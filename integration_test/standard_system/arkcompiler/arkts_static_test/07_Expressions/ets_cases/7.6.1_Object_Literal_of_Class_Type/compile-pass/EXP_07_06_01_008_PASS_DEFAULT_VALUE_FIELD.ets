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
 * @id EXP_07_06_01_008_PASS_DEFAULT_VALUE_FIELD
 * @expect compile-pass
 * @section 7.6.1
 * @design 值类型默认值字段可跳过：class C { public f1: number; f2: string = "hello" }，f1 为值类型有默认值 0，可跳过
 * @note 正向用例：验证值类型（如 number）有默认值，可在对象字面量中跳过
 */
class C {
    public f1: number
    public f2: string = 'hello'
}
let c: C = {f2: 'hello'}

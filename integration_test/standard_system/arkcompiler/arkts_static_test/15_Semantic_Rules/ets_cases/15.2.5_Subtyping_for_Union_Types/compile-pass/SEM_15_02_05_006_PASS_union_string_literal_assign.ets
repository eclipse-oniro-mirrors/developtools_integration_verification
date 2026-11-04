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
 * @id SEM_15_02_05_006_PASS_union_string_literal_assign
 * @expect compile-pass
 * @section 15.2.5
 * @design string 字面量 "aa" 是 string 子类型，string <: number|string
 * @note 来自规范 15.2.5 例：u = 'aa' OK
 */
function main(): void {
let u: number|string = 'aa'
}

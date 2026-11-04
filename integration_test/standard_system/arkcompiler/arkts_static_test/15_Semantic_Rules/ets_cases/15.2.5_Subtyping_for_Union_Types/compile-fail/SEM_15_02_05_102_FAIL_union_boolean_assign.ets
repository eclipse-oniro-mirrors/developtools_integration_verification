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
 * @id SEM_15_02_05_102_FAIL_union_boolean_assign
 * @expect compile-fail
 * @section 15.2.5
 * @design boolean 不是 number|string 的成员，不可赋值
 * @note 来自规范 15.2.5 例：u = true 编译错误
 */
function main(): void {
    let u: number|string = 1.0
    u = true
}

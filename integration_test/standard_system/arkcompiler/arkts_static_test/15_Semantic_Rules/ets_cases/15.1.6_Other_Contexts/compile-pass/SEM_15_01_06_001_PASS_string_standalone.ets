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
 * @id SEM_15_01_06_001_PASS_string_standalone
 * @expect compile-pass
 * @section 15.1.6
 * @design 其他上下文：独立字符串表达式推断
 * @note 正向用例：字符串字面量作为独立表达式推断为 string
 */
function main(): void {
    let s = 'standalone';
    let t: string = s;
    console.log(t);
}

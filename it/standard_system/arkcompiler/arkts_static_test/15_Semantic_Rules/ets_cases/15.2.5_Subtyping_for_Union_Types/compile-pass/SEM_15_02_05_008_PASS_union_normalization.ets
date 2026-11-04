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
 * @id SEM_15_02_05_008_PASS_union_normalization
 * @expect compile-pass
 * @section 15.2.5
 * @design 联合类型归一化：字面量 "abc"|"cde" 均为 string 子类型，合并为 string
 * @note 来自规范 15.2.5 例：let u: 'abc'|"cde"|string → u 类型为 string
 */
function main(): void {
    let u: 'abc'|'cde'|string = 'abc'
    let v: string = u
}

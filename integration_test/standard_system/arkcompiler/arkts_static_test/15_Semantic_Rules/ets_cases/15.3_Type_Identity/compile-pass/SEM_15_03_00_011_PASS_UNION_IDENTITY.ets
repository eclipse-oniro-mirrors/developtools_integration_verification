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
 * @id SEM_15_03_00_011_PASS_UNION_IDENTITY
 * @expect compile-pass
 * @section 15.3
 * @design 验证联合类型同一性：相同成员的联合类型视为同一类型
 * @note 正向用例：string|int 和 int|string 是同一类型（成员顺序无关）
 */
function main(): void {
    let a: string|int = 42;
    let b: int|string = a;
    console.log(`b=${b}`);
}

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
 * @id SEM_15_03_00_002_PASS_TYPE_ALIAS_IDENTITY
 * @expect compile-pass
 * @section 15.3
 * @design 验证类型别名同一性：type MyInt = int，MyInt 和 int 是同一类型
 * @note 正向用例：类型别名与其展开类型同一，可互相赋值
 */
type MyInt = int;
function main(): void {
    let x: MyInt = 42;
    let y: int = x;
    console.log(`y=${y}`);
}

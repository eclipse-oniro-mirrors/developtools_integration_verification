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
 * @id SEM_15_01_04_003_PASS_MIXED_NUMERIC
 * @expect compile-pass
 * @section 15.1.4
 * @design 验证混合数值类型运算拓宽：int + long → long
 * @note 正向用例：不同类型数值运算时拓宽到较大类型
 */
function main(): void {
    let i: int = 10;
    let d: double = 3.5;
    let r = i + d;
    let r2: double = r;
    console.log(`${r2}`);
}

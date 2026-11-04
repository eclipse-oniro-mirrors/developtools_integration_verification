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
 * @id SEM_15_01_03_006_PASS_infer_array_from_literal
 * @expect compile-pass
 * @section 15.1.3
 * @design 规范示例：数组字面量作为独立表达式推断变量类型
 * @note 正向用例：let y = [1, 2] 推断为 int[]
 */
function main(): void {
    let y = [1, 2];
    let first: int = y[0];
    console.log(`${first}`);
}

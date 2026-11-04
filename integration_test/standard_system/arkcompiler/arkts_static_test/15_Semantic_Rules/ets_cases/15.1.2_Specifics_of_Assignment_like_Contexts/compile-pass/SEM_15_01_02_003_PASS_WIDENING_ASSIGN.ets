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
 * @id SEM_15_01_02_003_PASS_WIDENING_ASSIGN
 * @expect compile-pass
 * @section 15.1.2
 * @design 验证赋值上下文中数值拓宽：int → double 可赋值
 * @note 正向用例：int 通过数值拓宽可赋值给 double
 */
function main(): void {
    let d: double;
    d = 42;
    console.log(`d=${d}`);
}

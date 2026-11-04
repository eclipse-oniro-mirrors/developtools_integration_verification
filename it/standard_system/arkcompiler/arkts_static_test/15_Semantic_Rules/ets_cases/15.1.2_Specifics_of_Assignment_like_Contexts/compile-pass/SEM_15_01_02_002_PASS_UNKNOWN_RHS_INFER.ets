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
 * @id SEM_15_01_02_002_PASS_UNKNOWN_RHS_INFER
 * @expect compile-pass
 * @section 15.1.2
 * @design 验证赋值上下文中 RHS 类型未知时从 LHS 类型推断
 * @note 正向用例：RHS 的无类型字面量应根据 LHS 类型推断
 */
function main(): void {
    let x: int;
    x = 42;
    let s: string;
    s = 'test';
    console.log(`x=${x}, s=${s}`);
}

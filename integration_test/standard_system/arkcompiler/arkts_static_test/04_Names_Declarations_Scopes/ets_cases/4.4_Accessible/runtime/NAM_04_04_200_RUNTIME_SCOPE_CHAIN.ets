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
 * @id NAM_04_04_200_RUNTIME_SCOPE_CHAIN
 * @expect runtime
 * @section 4.4
 * @design 作用域链运行时验证
 * @note 运行时用例：验证嵌套作用域中变量按正确顺序查找（外层→内层）
 */
function main(): void {
    let outer: number = 10;
    {
        let inner: number = 20;
        // inner accessible, outer accessible from enclosing scope
        if (inner + outer != 30) {
            throw new Error("assertion failed: " + (inner + outer));
        }
    }
    // outer still accessible after inner block
    if (outer != 10) {
        throw new Error("assertion failed: " + outer);
    }
    console.log("verified");
}

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
 * @id NAM_04_04_201_RUNTIME_NESTED_SHADOW
 * @expect runtime
 * @section 4.4
 * @design 嵌套块遮蔽运行时验证
 * @note 运行时用例：验证内层同名变量遮蔽外层，内层赋值不影响外层值
 */
function main(): void {
    let x: number = 1;
    {
        let x: number = 100;
        if (x != 100) {
            throw new Error("assertion failed: " + x);
        }
    }
    // outer x should remain unchanged after inner block
    if (x != 1) {
        throw new Error("assertion failed: " + x);
    }
    console.log("verified");
}

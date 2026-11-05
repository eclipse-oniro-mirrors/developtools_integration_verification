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
 * @id NAM_04_03_007_PASS_NESTED_BLOCK
 * @expect compile-pass
 * @section 4.3
 * @design 嵌套块作用域
 * @note 正向用例：验证多层嵌套块作用域
 */
function nestedBlocks(): void {
    let a: number = 1;
    if (a > 0) {
        let b: number = 2;
        while (b > 0) {
            let c: number = a + b;
            b = b - 1;
        }
    }
}

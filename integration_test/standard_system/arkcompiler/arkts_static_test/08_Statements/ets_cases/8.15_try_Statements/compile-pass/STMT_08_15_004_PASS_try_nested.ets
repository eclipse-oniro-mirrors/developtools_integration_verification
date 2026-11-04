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
 * @id STMT_08_15_004_PASS_try_nested
 * @expect compile-pass
 * @section 8.15
 * @design 验证嵌套 try 语句结构编译通过
 * @note try 块内部可以包含另一个 try-catch 结构
 */
function testNestedTry(): void {
    let result: int = 0;
    try {
        try {
            result = 1;
        } catch (e) {
            result = -1;
        }
    } catch (e) {
        result = -2;
    } finally {
        result = 99;
    }
}

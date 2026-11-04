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
 * @id STMT_08_15_001_PASS_try_catch
 * @expect compile-pass
 * @section 8.15
 * @design 验证基本的 try-catch 结构编译通过
 * @note try 块后跟 catch 子句，符合语法要求
 */
function testTryCatch(): void {
    let x: int = 0;
    try {
        x = 42;
    } catch (e) {
        x = -1;
    }
}

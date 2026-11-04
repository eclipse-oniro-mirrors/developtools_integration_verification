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
 * @id STMT_08_08_001_PASS_BASIC_FOR
 * @expect compile-pass
 * @section 8.8
 * @design 基础 for 循环，forInit 中声明新变量 i 并显式指定 int 类型
 * @note 正向用例：for (let i: int = 0; i < 10; i++) { ... }
 */
function testBasicFor(): void {
    let sum: int = 0
    for (let i: int = 0; i < 5; i++) {
        sum = sum + i
    }
}

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
 * @id STMT_08_08_003_PASS_FOR_EXISTING_VAR
 * @expect compile-pass
 * @section 8.8
 * @design 使用已存在的变量作为循环索引，而非在 forInit 中声明新变量
 * @note 正向用例：int idx = 0; for (; idx < 10; idx++) { ... }
 */
function testForExistingVar(): void {
    let idx: int = 0
    let sum: int = 0
    for (; idx < 5; idx++) {
        sum = sum + idx
    }
}

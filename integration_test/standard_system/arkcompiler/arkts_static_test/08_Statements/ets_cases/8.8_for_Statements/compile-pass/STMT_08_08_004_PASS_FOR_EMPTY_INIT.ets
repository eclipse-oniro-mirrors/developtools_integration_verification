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
 * @id STMT_08_08_004_PASS_FOR_EMPTY_INIT
 * @expect compile-pass
 * @section 8.8
 * @design for 循环的 forInit 和 forUpdate 均为空，仅保留条件表达式
 * @note 正向用例：for (; i < 10; i++) { ... } 空 init 和 update
 */
function testForEmptyInit(): void {
    let i: int = 0
    let sum: int = 0
    for (; i < 5; i++) {
        sum = sum + 1
    }
}

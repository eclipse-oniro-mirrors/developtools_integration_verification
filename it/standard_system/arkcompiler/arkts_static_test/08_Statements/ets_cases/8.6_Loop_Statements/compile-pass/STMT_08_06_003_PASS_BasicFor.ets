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
 * @id STMT_08_06_003_PASS_BasicFor
 * @expect compile-pass
 * @section 8.6
 * @design 基本for循环：包含初始化、条件判断、更新表达式，支持多种写法
 * @note 验证for循环基本语法，包括空初始化和空更新表达式
 */
function testBasicFor(): void {
    let sum: int = 0;
    for (let i: int = 0; i < 5; i++) {
        sum += i;
    }
    let j: int = 0;
    for (; j < 3; j++) {
        sum += j;
    }
    for (let k: int = 0; k < 2; ) {
        sum += k;
        break;
    }
}

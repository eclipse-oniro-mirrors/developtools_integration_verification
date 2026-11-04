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
 * @id STMT_08_03_002_PASS_nested_blocks
 * @expect compile-pass
 * @section 8.3
 * @design 嵌套块语句：块中嵌套块，多层嵌套，不同作用域级别
 * @note 正向用例：块嵌套场景，验证嵌套块编译通过
 */
function testNestedBlocks(): void {
    let outer: int = 1;
    {
        let inner1: int = 2;
        outer = outer + inner1;
        {
            let inner2: int = 3;
            outer = outer + inner2;
            {
                let inner3: int = 4;
                outer = outer + inner3;
            }
        }
    }
}

function testNestedEmptyBlocks(): void {
    let x: int = 0;
    {
        {
            {
                x = 42;
            }
        }
    }
}

function testNestedBlockShadowing(): void {
    let x: int = 10;
    {
        let x: int = 20;
        {
            let x: int = 30;
            x = x + 1;
        }
    }
}

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
 * @id STMT_08_03_001_PASS_basic_block
 * @expect compile-pass
 * @section 8.3
 * @design 基本块语句，多个语句在块中按文本顺序执行：赋值、表达式、变量声明、函数调用、控制流
 * @note 正向用例：块中最基本的多种语句类型组合，验证编译通过
 */
function testBasicBlock(): void {
    // block with multiple statements
    {
        let x: int = 1;
        let y: int = 2;
        let z: int = x + y;
        // expression statement
        z + 1;
        // assignment
        x = 10;
        y = 20;
    }
}

function testBlockWithControlFlow(): void {
    {
        let a: int = 0;
        if (a == 0) {
            a = 1;
        }
        let sum: int = 0;
        for (let i: int = 0; i < 3; i++) {
            sum = sum + i;
        }
        let j: int = 0;
        while (j < 3) {
            j++;
        }
    }
}

function testBlockWithSideEffects(): void {
    let counter: int = 0;
    {
        counter++;
        counter++;
        counter = counter + 1;
    }
}

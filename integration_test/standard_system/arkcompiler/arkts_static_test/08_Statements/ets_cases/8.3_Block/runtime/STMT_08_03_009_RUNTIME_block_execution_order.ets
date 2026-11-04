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
 * @id STMT_08_03_009_RUNTIME_block_execution_order
 * @expect runtime
 * @section 8.3
 * @design 验证块中语句按文本顺序执行，变量值随顺序逐步变更
 * @note 运行时用例：验证 block 语句的顺序执行语义
 */
function main(): void {
    // Test sequential execution in block
    let a: int = 0;
    let b: int = 0;
    {
        a = 10;
        b = 20;
        a = a + b;
    }
    if (a != 30) {
        throw new Error("sequential execution failed: a should be 30 but got " + a);
    }
    if (b != 20) {
        throw new Error("sequential execution failed: b should be 20 but got " + b);
    }

    // Test nested block execution order
    let x: int = 0;
    {
        x = 1;
        {
            x = x * 2;
            {
                x = x + 5;
            }
        }
    }
    if (x != 7) {
        throw new Error("nested block execution failed: x should be 7 but got " + x);
    }

    // Test that statements before and after block work correctly
    let y: int = 0;
    y = 5;
    {
        y = y * 2;
    }
    y = y + 1;
    if (y != 11) {
        throw new Error("block with surrounding statements failed: y should be 11 but got " + y);
    }

    console.log("verified");
}

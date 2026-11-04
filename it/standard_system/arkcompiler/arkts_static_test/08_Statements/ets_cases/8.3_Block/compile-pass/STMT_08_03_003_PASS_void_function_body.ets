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
 * @id STMT_08_03_003_PASS_void_function_body
 * @expect compile-pass
 * @section 8.3
 * @design void 函数体作为块，不包含 return 语句（隐式返回），以及包含 return; 无返回值
 * @note 正向用例：void 函数体块，隐式返回行为
 */
function testVoidFunctionNoReturn(): void {
    let x: int = 1;
    let y: int = 2;
    let z: int = x + y;
}

function testVoidFunctionEmptyReturn(): void {
    let x: int = 1;
    if (x > 0) {
        return;
    }
    x = 0;
}

function testVoidFunctionReturnInBranch(): void {
    let x: int = 10;
    if (x > 5) {
        return;
    } else {
        x = 0;
    }
}

function testVoidFunctionReturnInBlock(): void {
    let flag: boolean = true;
    {
        if (flag) {
            return;
        }
    }
    // unreachable but still valid
    flag = false;
}

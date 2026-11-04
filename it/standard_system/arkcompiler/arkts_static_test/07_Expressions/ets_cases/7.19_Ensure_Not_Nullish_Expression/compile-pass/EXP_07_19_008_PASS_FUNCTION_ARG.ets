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
 * @id EXP_07_19_008_PASS_FUNCTION_ARG
 * @expect compile-pass
 * @section 7.19
 * @design 验证 ! 在函数调用参数中编译通过
 * @note 正向用例：! 表达式作为函数参数编译通过
 */
function twice(n: int): int {
    return n * 2
}

function testNonNullishArg(): void {
    let x: int | undefined = 21
    let r: int = twice(x!)
}

class MyObj {
    public f: int = 1
}

function getF(c: MyObj): int {
    return c.f
}

function testObjectArg(): void {
    let c: MyObj | undefined = new MyObj()
    let v: int = getF(c!)
}

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
 * @id STMT_08_15_2_013_PASS_finally_return_override
 * @expect compile-pass
 * @section 8.15.2
 * @design 测试finally块中包含return语句：当finally块中有return时，会覆盖try块或catch块中的return值。验证编译器允许finally块中出现return语句，且这是合法语法。
 * @note 正向测试：finally块中的return为合法语法，代码应正确编译通过
 */
function testFinallyReturnOverride(): number {
    let flag: number = 0;
    try {
        flag = 10;
        return flag;
    } finally {
        // return in finally overrides try's return value
        flag = 99;
        return flag;
    }
}

function testFinallyReturnFromCatch(): number {
    try {
        throw new Error("err");
    } catch (e) {
        return 1;
    } finally {
        // return in finally overrides catch's return
        return 2;
    }
}

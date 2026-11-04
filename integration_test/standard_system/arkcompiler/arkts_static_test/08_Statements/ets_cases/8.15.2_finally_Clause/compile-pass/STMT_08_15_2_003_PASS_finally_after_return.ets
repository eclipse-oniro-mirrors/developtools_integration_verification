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
 * @id STMT_08_15_2_003_PASS_finally_after_return
 * @expect compile-pass
 * @section 8.15.2
 * @design 测试try块中包含return语句时，finally块在return之前执行。验证finally子句的语义优先级：即使有return流程，finally仍会在方法返回前执行。
 * @note 正向测试：return语句与finally的执行顺序，验证编译器正确处理return+finally组合
 */
function finallyFunc(): number {
    let flag: number = 0;
    try {
        flag = 1;
        return flag;
    } finally {
        flag = 2;
    }
    return flag;
}

function testFinallyAfterReturn(): void {
    let result: number = finallyFunc();
    if (result != 1) {
        console.log("FAIL: return value should be 1 but got " + result);
    }
}

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
 * @id STMT_08_15_3_008_RUNTIME_try_normal_completion
 * @expect runtime
 * @section 8.15.3
 * @design 验证规则1：try 块正常完成（无异常抛出）时 catch 子句不执行，整个 try 语句正常完成。
 * @note try 块体不抛出异常，catch 不执行，finally 正常执行。验证结果反映 try 块的正常赋值。
 */
function main(): void {
    let result: int = 0;
    let catchFlag: int = 0;
    try {
        result = 100;
    } catch (e) {
        catchFlag = 1;
    } finally {
        result = result + 50;
    }
    if (result != 150) {
        throw new Error("try block normal completion failed: result should be 150");
    }
    if (catchFlag != 0) {
        throw new Error("catch should not execute when no error is thrown");
    }
    console.log("verified");
}

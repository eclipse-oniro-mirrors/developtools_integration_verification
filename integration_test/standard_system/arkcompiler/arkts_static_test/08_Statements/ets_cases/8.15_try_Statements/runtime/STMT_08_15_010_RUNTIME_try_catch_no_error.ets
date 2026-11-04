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
 * @id STMT_08_15_010_RUNTIME_try_catch_no_error
 * @expect runtime
 * @section 8.15
 * @design 验证 try 块未抛出异常时 catch 子句不执行
 * @note try 块正常完成则 catch 不执行，结果应为 try 块中的赋值
 */
function main(): void {
    let result: int = 0;
    try {
        result = 100;
    } catch (e) {
        result = -1;
    }
    if (result != 100) {
        throw new Error("No error thrown but catch was executed");
    }
    console.log("verified");
}

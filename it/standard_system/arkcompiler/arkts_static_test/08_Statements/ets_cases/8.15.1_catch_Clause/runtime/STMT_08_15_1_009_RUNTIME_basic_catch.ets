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
 * @id STMT_08_15_1_009_RUNTIME_basic_catch
 * @expect runtime
 * @section 8.15.1
 * @design 验证 catch 子句在运行时正确捕获抛出的 Error 对象，并获取 error.message 属性值。
 * @note 运行时测试：throw new Error("caught") 后，catch 块执行，验证 error.message 为 "caught"。
 */
function main(): void {
    let caught: boolean = false;
    let msg: string = "";
    try {
        throw new Error("runtime catch test");
    } catch (e) {
        caught = true;
        msg = e.message;
    }
    if (caught != true) {
        throw new Error("catch block was not executed");
    }
    if (msg != "runtime catch test") {
        throw new Error("error message mismatch: " + msg);
    }
    console.log("verified");
}

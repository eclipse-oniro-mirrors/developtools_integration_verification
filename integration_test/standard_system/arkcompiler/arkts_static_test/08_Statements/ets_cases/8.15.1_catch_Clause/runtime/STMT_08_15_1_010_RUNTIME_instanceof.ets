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
 * @id STMT_08_15_1_010_RUNTIME_instanceof
 * @expect runtime
 * @section 8.15.1
 * @design 验证 catch 块中使用 instanceof 区分不同的 Error 子类型，分别处理 RangeError 和 TypeError。
 * @note 运行时测试：抛出 RangeError，instanceof 分支正确判断，验证类型区分逻辑在运行时生效。
 */
function main(): void {
    let errorType: string = "";
    try {
        throw new RangeError("range error value");
    } catch (e) {
        if (e instanceof RangeError) {
            errorType = "RangeError";
        } else if (e instanceof TypeError) {
            errorType = "TypeError";
        } else {
            errorType = "Error";
        }
    }
    if (errorType != "RangeError") {
        throw new Error("instanceof check failed, got: " + errorType);
    }

    errorType = "";
    try {
        throw new TypeError("type error value");
    } catch (e) {
        if (e instanceof RangeError) {
            errorType = "RangeError";
        } else if (e instanceof TypeError) {
            errorType = "TypeError";
        } else {
            errorType = "Error";
        }
    }
    if (errorType != "TypeError") {
        throw new Error("instanceof check failed for TypeError, got: " + errorType);
    }
    console.log("verified");
}

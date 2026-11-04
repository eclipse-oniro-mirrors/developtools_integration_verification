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
 * @id STMT_08_15_1_012_RUNTIME_error_translation
 * @expect runtime
 * @section 8.15.1
 * @design 验证 catch 块捕获错误后抛出不同类型的错误（错误转换），外层 catch 能正确捕获转换后的新版错误。
 * @note 运行时测试：内层 try 抛出 RangeError，catch 转换后抛出新的 TypeError，外层 catch 应捕获 TypeError 并验证消息。
 */
function main(): void {
    let translated: boolean = false;
    try {
        try {
            throw new RangeError("low-level range failure");
        } catch (e) {
            if (e instanceof RangeError) {
                throw new TypeError("translated: " + e.message);
            }
        }
    } catch (outer) {
        if (outer instanceof TypeError) {
            if (outer.message == "translated: low-level range failure") {
                translated = true;
            }
        }
    }
    if (!translated) {
        throw new Error("error translation failed: expected TypeError");
    }
    console.log("verified");
}

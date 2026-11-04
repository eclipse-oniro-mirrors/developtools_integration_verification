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
 * @id STMT_08_15_1_016_PASS_catch_throw_translated_error
 * @expect compile-pass
 * @section 8.15.1
 * @design 验证 catch 块中捕获原始错误后抛出新的不同 Error 类型（错误转换），代码能够通过编译。
 * @note 正向测试：catch 根据 instanceof 判断原始错误类型，构造并抛出新的 TypeError 作为转换后的错误。
 */
function testCatchThrowTranslatedError(): void {
    try {
        throw new RangeError("original error");
    } catch (e) {
        if (e instanceof RangeError) {
            throw new TypeError("translated from: " + e.message);
        }
        throw e;
    }
}

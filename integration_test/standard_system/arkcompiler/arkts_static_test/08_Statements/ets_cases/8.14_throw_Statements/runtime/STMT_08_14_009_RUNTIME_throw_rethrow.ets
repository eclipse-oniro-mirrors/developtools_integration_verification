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
 * @id STMT_08_14_009_RUNTIME_throw_rethrow
 * @expect runtime
 * @section 8.14
 * @design 测试catch块中rethrow重新抛出，验证异常可重新传播到外层try-catch
 * @note 内层catch捕获后重新抛出，由外层catch再次捕获，验证rethrow机制正常
 */

function main(): void {
    let caught: boolean = false;
    try {
        try {
            throw new Error("inner error");
        } catch (e) {
            throw e;
        }
    } catch (e) {
        caught = true;
    }
    if (!caught) {
        throw new Error("throw_rethrow: expected rethrown exception to be caught");
    }
    console.log("verified");
}

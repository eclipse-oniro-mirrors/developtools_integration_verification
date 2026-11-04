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
 * @id STMT_08_14_015_RUNTIME_multi_nested_try_catch
 * @expect runtime
 * @section 8.14
 * @design 测试多层嵌套try-catch，验证throw由最近的catch块捕获
 * @note 三层try-catch嵌套，中间层抛出异常，应被内层catch捕获而不会传播到外层
 */

function main(): void {
    let caughtByInner: boolean = false;
    let caughtByOuter: boolean = false;
    try {
        try {
            try {
                throw new Error("deep throw");
            } catch (e) {
                caughtByInner = true;
            }
        } catch (e) {
            caughtByOuter = true;
        }
    } catch (e) {
        caughtByOuter = true;
    }
    if (!caughtByInner) {
        throw new Error("multi_nested: expected inner catch to capture the throw");
    }
    if (caughtByOuter) {
        throw new Error("multi_nested: outer catch should not have been triggered");
    }
    console.log("verified");
}

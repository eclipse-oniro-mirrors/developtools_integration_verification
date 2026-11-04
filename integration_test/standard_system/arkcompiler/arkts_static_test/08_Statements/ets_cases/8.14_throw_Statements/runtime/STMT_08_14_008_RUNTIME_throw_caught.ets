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
 * @id STMT_08_14_008_RUNTIME_throw_caught
 * @expect runtime
 * @section 8.14
 * @design 测试throw被try-catch捕获，验证异常传播到最近catch块
 * @note 在try块中抛出Error，由catch正常捕获，验证caught标志位为true
 */

function main(): void {
    let caught: boolean = false;
    try {
        throw new Error("caught exception");
    } catch (e) {
        caught = true;
    }
    if (!caught) {
        throw new Error("throw_caught: expected exception to be caught");
    }
    console.log("verified");
}

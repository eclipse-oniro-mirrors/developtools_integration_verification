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
 * @id CCY_16_03_02_005_PASS_async_lambda_closure
 * @expect compile-pass
 * @section 16.3.2
 * @design async lambda 闭包捕获外部变量
 * @note 正向用例：验证 async lambda 捕获外部作用域变量通过编译
 */
function main(): void {
    let factor: number = 2;
    let f: () => Promise<number> = async () => {
        return factor * 21;
    };
    let p: Promise<number> = f();
}

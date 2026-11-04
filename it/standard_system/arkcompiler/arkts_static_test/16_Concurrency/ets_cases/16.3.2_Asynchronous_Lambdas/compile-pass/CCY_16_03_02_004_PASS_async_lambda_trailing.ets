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
 * @id CCY_16_03_02_004_PASS_async_lambda_trailing
 * @expect compile-pass
 * @section 16.3.2
 * @design async lambda trailing lambda 语法
 * @note 正向用例：验证 async lambda 作为尾随 lambda 通过编译
 */
function invoke(f: () => Promise<number>): void {
    let p: Promise<number> = f();
}
function main(): void {
    invoke(async () => {
        return 42;
    });
}

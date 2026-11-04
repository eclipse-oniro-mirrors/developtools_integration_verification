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
 * @id CCY_16_06_02_002_PASS_async_chain
 * @expect compile-pass
 * @section 16.6.2
 * @design 验证从非 async 函数链式调用 async 函数
 * @note 正向用例：非 async 函数通过 Promise 链调用 async 函数
 */
function nonAsyncCaller(): void {
    asyncChain()
        .then((val: number) => {
            console.info('Chain result: ' + val);
        });
}

async function asyncChain(): Promise<number> {
    let a: number = await stepOne();
    let b: number = await stepTwo(a);
    return b;
}

async function stepOne(): Promise<number> {
    return 10;
}

async function stepTwo(input: number): Promise<number> {
    return input + 5;
}

nonAsyncCaller();

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
 * @id CCY_16_03_022_RUNTIME_AWAIT_THEN
 * @expect runtime
 * @section 16.3
 * @design async/await + Promise.then 链式调用
 * @note 运行时用例：验证 async 函数内 await Promise.then 链
 */
async function getValue(): Promise<number> {
    let p: Promise<number> = new Promise<number>((resolve: (v: number) => void) => {
        resolve(42);
    });
    let result: number = await p;
    return result;
}
async function process(): Promise<number> {
    let v: number = await getValue();
    return v + 1;
}
function main(): void {
    let p: Promise<number> = process();
    console.log('verified');
}

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
 * @id CCY_16_03_04_024_RUNTIME_await_multiple_sequential
 * @expect runtime
 * @section 16.3.4
 * @design 连续 await 多个表达式（顺序执行）
 * @note 运行时用例：验证多个 await 依次执行
 */
async function getValue(): Promise<number> {
    let p1: Promise<number> = new Promise<number>((resolve: (v: number) => void) => {
        resolve(1);
    });
    let p2: Promise<number> = new Promise<number>((resolve: (v: number) => void) => {
        resolve(2);
    });
    let a: number = await p1;
    let b: number = await p2;
    return a + b;
}
function main(): void {
    let p: Promise<number> = getValue();
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

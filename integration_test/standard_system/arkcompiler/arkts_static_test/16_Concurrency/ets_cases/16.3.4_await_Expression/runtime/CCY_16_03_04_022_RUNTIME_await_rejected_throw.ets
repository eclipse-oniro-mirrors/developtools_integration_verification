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
 * @id CCY_16_03_04_022_RUNTIME_await_rejected_throw
 * @expect runtime
 * @section 16.3.4
 * @design await rejected Promise 抛出异常
 * @note 运行时用例：验证 await 拒绝的 Promise 抛出 rejection 错误
 */
async function fail(): Promise<number> {
    let p: Promise<number> = new Promise<number>((resolve: (v: number) => void, reject: (e: Error) => void) => {
        reject(new Error('rejected'));
    });
    let v: number = await p;
    return v;
}
function main(): void {
    let p: Promise<number> = fail();
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

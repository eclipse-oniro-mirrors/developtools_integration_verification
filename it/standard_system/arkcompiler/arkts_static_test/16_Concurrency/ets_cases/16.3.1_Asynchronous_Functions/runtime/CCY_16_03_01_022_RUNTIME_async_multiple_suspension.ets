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
 * @id CCY_16_03_01_022_RUNTIME_async_multiple_suspension
 * @expect runtime
 * @section 16.3.1
 * @design async 函数多悬挂点（多次 await）执行顺序
 * @note 运行时用例：验证 async 函数内多个悬挂点依次执行
 */
async function step1(): Promise<number> {
    return 1;
}
async function step2(v: number): Promise<number> {
    return v + 1;
}
async function step3(v: number): Promise<number> {
    return v + 1;
}
function main(): void {
    let p1: Promise<number> = step1();
    let p2: Promise<number> = step2(1);
    let p3: Promise<number> = step3(2);
    if (p1 == undefined || p2 == undefined || p3 == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

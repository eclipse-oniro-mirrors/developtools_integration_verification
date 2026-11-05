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
 * @id CCY_16_04_02_021_RUNTIME_launch_multiple_concurrent
 * @expect runtime
 * @section 16.4.2
 * @design 多个并发 launch 执行
 * @note 运行时用例：验证多个 launch 同时执行
 */
async function test(): Promise<number> {
    let p1: Promise<number> = launch<number>((): number => {
        return 1;
    });
    let p2: Promise<number> = launch<number>((): number => {
        return 2;
    });
    let p3: Promise<number> = launch<number>((): number => {
        return 3;
    });
    let a: number = await p1;
    let b: number = await p2;
    let c: number = await p3;
    return a + b + c;
}
function main(): void {
    let p: Promise<number> = test();
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

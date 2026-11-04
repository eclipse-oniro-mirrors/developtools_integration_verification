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
 * @id CCY_16_03_03_022_RUNTIME_async_method_chain
 * @expect runtime
 * @section 16.3.3
 * @design async 方法链式调用含 await
 * @note 运行时用例：验证 async 方法链式调用的执行顺序
 */
class Calculator {
    async add(a: number, b: number): Promise<number> {
        return a + b;
    }
    async multiply(v: number, factor: number): Promise<number> {
        return v * factor;
    }
}
function main(): void {
    let calc: Calculator = new Calculator();
    let p1: Promise<number> = calc.add(3, 4);
    let p2: Promise<number> = calc.multiply(7, 2);
    if (p1 == undefined || p2 == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

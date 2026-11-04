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
 * @id CCY_16_03_04_023_RUNTIME_await_optional_chain
 * @expect runtime
 * @section 16.3.4
 * @design await 可选链 ?. 的条件悬挂
 * @note 运行时用例：验证 await 可选链中条件悬挂行为
 */
class Helper {
    async getValue(): Promise<number> {
        return 42;
    }
}
async function test(obj: Helper | undefined): Promise<number | undefined> {
    let v: number | undefined = await obj?.getValue();
    return v;
}
function main(): void {
    let helper: Helper = new Helper();
    let p: Promise<number | undefined> = test(helper);
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

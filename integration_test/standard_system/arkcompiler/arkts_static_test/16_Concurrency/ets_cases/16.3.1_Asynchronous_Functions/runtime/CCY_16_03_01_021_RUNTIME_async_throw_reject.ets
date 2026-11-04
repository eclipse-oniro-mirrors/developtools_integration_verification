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
 * @id CCY_16_03_01_021_RUNTIME_async_throw_reject
 * @expect runtime
 * @section 16.3.1
 * @design async 函数内 throw 异常 → Promise rejected
 * @note 运行时用例：验证 async 函数抛出异常导致 Promise reject
 */
async function fail(): Promise<number> {
    throw new Error('fail');
}
function main(): void {
    let p: Promise<number> = fail();
    if (p == undefined) {
    throw new Error('assertion failed: expected Promise');
  }
  }
    }
console.log('verified');
}

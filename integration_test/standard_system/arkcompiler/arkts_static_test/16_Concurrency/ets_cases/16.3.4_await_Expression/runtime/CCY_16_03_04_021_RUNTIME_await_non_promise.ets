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
 * @id CCY_16_03_04_021_RUNTIME_await_non_promise
 * @expect runtime
 * @section 16.3.4
 * @design await 非 Promise 值立即返回（无悬挂）
 * @note 运行时用例：验证 await 非 Promise 类型不挂起，直接返回值
 */
async function getValue(): Promise<number> {
    let v: number = await 42;
    return v;
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

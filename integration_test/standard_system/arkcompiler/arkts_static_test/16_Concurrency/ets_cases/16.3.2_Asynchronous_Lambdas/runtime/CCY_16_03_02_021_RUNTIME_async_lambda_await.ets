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
 * @id CCY_16_03_02_021_RUNTIME_async_lambda_await
 * @expect runtime
 * @section 16.3.2
 * @design async lambda 内含 await 悬挂点执行
 * @note 运行时用例：验证 async lambda 内 await 正常执行返回
 */
async function getValue(): Promise<number> {
    return 7;
}
function main(): void {
    let f: () => Promise<number> = async () => {
        let v: number = await getValue();
        return v + 1;
    };
    let p: Promise<number> = f();
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

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
 * @id CCY_16_07_001_PASS_placeholder
 * @expect compile-pass
 * @section 16.7
 * @design 运行时实现细节：async main 支持多 await
 * @note 正向用例：async entry point 支持多个 sequential await
 */
async function delay(ms: number): Promise<void> {
    return new Promise<void>((resolve) => { setTimeout(resolve, ms); });
}

async function main(): async void {
    console.log('start');
    await delay(10);
    console.log('after delay');
    await delay(10);
    console.log('verified');
}

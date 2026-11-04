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
 * @id CCY_16_06_02_090_FAIL_async_chain_wrong
 * @expect compile-fail
 * @section 16.6.2
 * @design 非 async 函数中错误使用 async 返回值
 * @note 反向用例：验证非 async 函数中 await 调用应编译报错
 */
async function getValue(): Promise<number> {
    return 42;
}
function caller(): void {
    let v: number = getValue();
}

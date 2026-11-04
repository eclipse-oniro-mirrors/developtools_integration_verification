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
 * @id CCY_16_01_090_FAIL_suspension_in_non_async
 * @expect compile-fail
 * @section 16.1
 * @design 非 async 函数中不允许有悬挂点
 * @note 反向用例：await 只能在 async 函数中使用
 */
function foo(): void {
    let p: Promise<number> = new Promise((resolve) => { resolve(1); });
    let v: number = await p;
}

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
 * @id CCY_16_01_007_PASS_one_suspension_point
 * @expect compile-pass
 * @section 16.1
 * @design job 可以有一个悬挂点（await 暂停）
 * @note 正向用例：async 函数含一个 await，执行可在该点暂停和恢复
 */
async function delay(): Promise<void> {
    return new Promise<void>((resolve) => { setTimeout(resolve, 1); });
}

async function main(): Promise<void> {
    await delay();
    console.log('verified');
}

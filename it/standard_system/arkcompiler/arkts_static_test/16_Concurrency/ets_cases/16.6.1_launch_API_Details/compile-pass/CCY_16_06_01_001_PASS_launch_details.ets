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
 * @id CCY_16_06_01_001_PASS_launch_details
 * @expect compile-pass
 * @section 16.6.1
 * @design launch API 在 async 函数中的基本用法
 * @note 正向用例：纯 ArkTS 静态测试，验证 launch 配合 async lambda 编译通过
 *       launch domain/group/worker ID 参数为 stdlib 高阶 API，见 stdlib 文档
 */
async function main(): Promise<void> {
    let p: Promise<number> = launch<number>(async (): Promise<number> => {
        await Promise.resolve(0);
        return 42;
    });
    let result: number = await p;
    console.log('result: ' + result);
}

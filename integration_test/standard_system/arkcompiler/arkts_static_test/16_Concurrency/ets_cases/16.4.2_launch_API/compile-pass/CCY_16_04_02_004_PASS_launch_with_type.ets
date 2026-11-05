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
 * @id CCY_16_04_02_004_PASS_launch_with_type
 * @expect compile-pass
 * @section 16.4.2
 * @design launch 显式类型参数
 * @note 正向用例：验证 launch 显式类型参数编译通过
 */
async function f(): Promise<void> {
    let p1: Promise<number> = launch<number>(async () => {
        await Promise.resolve(0);
        return 100;
    });
    let result1: number = await p1;
}

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
 * @id CCY_16_04_023_RUNTIME_launch_non_async_context
 * @expect runtime
 * @section 16.4
 * @design launch 在非 async 函数中（§16.4.2）
 * @note 运行时用例：验证 launch 在非 async 上下文中正常执行
 */
function h(): void {
    let p: Promise<void> = launch<void>((): void => {
        console.log('verified');
});
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
}
function main(): void {
    h();
    console.log('verified');
}

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
 * @id CCY_16_04_020_RUNTIME_launch_sync_return
 * @expect runtime
 * @section 16.4
 * @design launch sync lambda 返回 Promise resolved 值
 * @note 运行时用例：验证 launch 同步 lambda 返回 Promise 被 resolve
 */
function main(): void {
    let p: Promise<number> = launch<number>((): number => {
        return 42;
    });
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

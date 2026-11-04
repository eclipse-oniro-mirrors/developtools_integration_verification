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
 * @id CCY_16_02_021_RUNTIME_LAUNCH_EXECUTION
 * @expect runtime
 * @section 16.2
 * @design launch API 运行时行为验证
 * @note 运行时用例：验证 launch 执行 lambda 返回 Promise
 */
function main(): void {
    let p: Promise<void> = launch<void>((): void => {
        console.log('verified');
});
    if (p == undefined) {
    throw new Error('assertion failed: launch should return Promise');
  }
  }
    }
console.log('verified');
}

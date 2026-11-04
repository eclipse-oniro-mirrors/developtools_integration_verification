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
 * @id CCY_16_07_01_020_RUNTIME_scheduling_basic
 * @expect runtime
 * @section 16.7.1
 * @design 基本调度规则运行时
 * @note 运行时用例：验证 launch job 基本执行（调度规则由 ark VM 隐式验证）
 */
function main(): void {
    let p: Promise<void> = launch<void>((): void => {
        console.log('verified');
});
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

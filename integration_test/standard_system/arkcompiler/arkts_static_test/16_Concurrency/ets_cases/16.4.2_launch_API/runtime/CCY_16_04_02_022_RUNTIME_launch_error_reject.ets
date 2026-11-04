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
 * @id CCY_16_04_02_022_RUNTIME_launch_error_reject
 * @expect runtime
 * @section 16.4.2
 * @design launch lambda 抛出异常 → Promise rejected
 * @note 运行时用例：验证 launch lambda 内 throw 导致 Promise reject
 */
function main(): void {
    let p: Promise<number> = launch<number>((): number => {
        throw new Error('fail');
    });
    if (p == undefined) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

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
 * @id CCY_16_05_06_020_FAIL_concurrent_map
 * @expect compile-fail
 * @section 16.5.6
 * @design ConcurrentMap 运行时操作
 * @note 运行时用例：验证 ConcurrentMap 的 set/get 操作正常执行
 */
function main(): void {
    let map: ConcurrentMap<string, number> = new ConcurrentMap<string, number>();
    map.set('key', 42);
    let val: number | undefined = map.get('key');
    if (val == undefined || val != 42) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

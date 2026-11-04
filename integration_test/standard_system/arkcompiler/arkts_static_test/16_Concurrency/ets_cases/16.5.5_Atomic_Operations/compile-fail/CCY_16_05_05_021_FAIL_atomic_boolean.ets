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
 * @id CCY_16_05_05_021_FAIL_atomic_boolean
 * @expect compile-fail
 * @section 16.5.5
 * @design AtomicBoolean 原子操作运行时
 * @note 运行时用例：验证 AtomicBoolean 的 set/get 操作正常执行
 */
function main(): void {
    let ab: AtomicBoolean = new AtomicBoolean(false);
    ab.set(true);
    let v: boolean = ab.get();
    if (v != true) {
    throw new Error('assertion failed');
  }
  }
    }
console.log('verified');
}

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
 * @id CCY_16_05_06_001_FAIL_concurrent_container
 * @expect compile-fail
 * @section 16.5.6
 * @design 并发容器使用
 * @note 正向用例：验证线程安全并发容器声明和操作编译通过
 */
let concurrentMap: ConcurrentMap<string, number> = new ConcurrentMap<string, number>();
function f(): void {
    concurrentMap.set('key', 42);
    let val: number | undefined = concurrentMap.get('key');
    console.log(val === undefined ? 'undefined' : val.toString());
}

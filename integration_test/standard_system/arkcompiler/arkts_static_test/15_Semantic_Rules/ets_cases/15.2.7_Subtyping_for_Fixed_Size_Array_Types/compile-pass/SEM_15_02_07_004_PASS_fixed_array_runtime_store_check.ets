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
 * @id SEM_15_02_07_004_PASS_fixed_array_runtime_store_check
 * @expect compile-pass
 * @section 15.2.7
 * @design FixedArray 运行时数组存储检查函数编译通过，运行时可能抛出 ArrayStoreError
 * @note 来自规范 15.2.7 例：foo(da) 编译通过但运行时可能 ArrayStoreError
 */
class C {}
class D extends C {}
function foo(ca: FixedC[]): void {
    ca[0] = new C()
}
function main(): void {
    let da: FixedD[] = [new D()]
    foo(da)
}

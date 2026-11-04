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
 * @id SEM_15_02_04_102_FAIL_tuple_length_mismatch
 * @expect compile-fail
 * @section 15.2.4
 * @design 更短元组不是更长元组的子类型（需要 n >= m）
 * @note 来自规范 15.2.4 例：t2 = t1 编译错误
 */
function main(): void {
    let t1: [number] = [42]
    let t2: [string, number] = ['hello', 42]
    t2 = t1
}

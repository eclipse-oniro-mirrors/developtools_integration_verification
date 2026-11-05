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
 * @id SEM_15_02_04_103_FAIL_tuple_element_type_mismatch
 * @expect compile-fail
 * @section 15.2.4
 * @design 元素类型不同的元组不可互相赋值：[number] 与 [string,number] 无关
 * @note 来自规范 15.2.4 例：t1 = t2 编译错误
 */
function main(): void {
    let t1: [number] = [42]
    let t2: [string, number] = ['hello', 42]
    t1 = t2
}

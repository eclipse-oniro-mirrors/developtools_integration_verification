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
 * @id SEM_15_02_04_001_PASS_TUPLE_IDENTITY
 * @expect compile-pass
 * @section 15.2.4
 * @design 验证元组类型的子类型关系：相同结构元组 <: 自身
 * @note 正向用例：[int, string] 应可赋值给相同结构的 [int, string] 变量
 */
function main(): void {
    let t1: [int, string] = [1, 'a'];
    let t2: [int, string] = t1;
    console.log(`t2[0]=${t2[0]}, t2[1]=${t2[1]}`);
}

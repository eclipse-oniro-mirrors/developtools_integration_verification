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
 * @id EXP_07_06_03_016_RUNTIME_OBJECT_VALUES
 * @expect runtime
 * @section 7.6.3
 * @design 验证 Record<string, PersonInfo> 对象值索引访问正确
 * @note 运行时用例：验证通过索引访问 Record 中的对象值，并访问其字段
 */
interface PersonInfo {
    age: number
    salary: number
}

function main(): void {
    let map: Record<string, PersonInfo> = {
        'John': { age: 25, salary: 10},
        'Mary': { age: 21, salary: 20}
    }
    if (map['John']!.age != 25) {
        throw new Error('assertion failed: John.age != 25')
    }
    if (map['Mary']!.salary != 20) {
        throw new Error('assertion failed: Mary.salary != 20')
    }
console.log('verified')
}

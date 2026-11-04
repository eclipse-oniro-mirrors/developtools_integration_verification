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
 * @id EXP_07_06_03_002_PASS_OBJECT_VALUES
 * @expect compile-pass
 * @section 7.6.3
 * @design Record<string, 对象类型> 对象作为值
 * @note 正向用例：验证 Record 的值可以是对象类型
 */
interface PersonInfo {
    age: number
    salary: number
}
let map: Record<string, PersonInfo> = {
    'John': { age: 25, salary: 10},
    'Mary': { age: 21, salary: 20}
}

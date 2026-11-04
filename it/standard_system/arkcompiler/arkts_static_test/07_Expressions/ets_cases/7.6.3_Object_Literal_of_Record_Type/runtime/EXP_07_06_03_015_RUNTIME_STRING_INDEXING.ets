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
 * @id EXP_07_06_03_015_RUNTIME_STRING_INDEXING
 * @expect runtime
 * @section 7.6.3
 * @design 验证 Record<string, number> 索引取值正确
 * @note 运行时用例：验证通过字符串索引访问 Record 中的值
 */
function main(): void {
    let map: Record<string, number> = {
        'John': 25,
        'Mary': 21,
    }
    if (map['John'] != 25) {
        throw new Error('assertion failed: John != 25, got ' + map['John'])
    }
    if (map['Mary'] != 21) {
        throw new Error('assertion failed: Mary != 21, got ' + map['Mary'])
    }
console.log('verified')
}

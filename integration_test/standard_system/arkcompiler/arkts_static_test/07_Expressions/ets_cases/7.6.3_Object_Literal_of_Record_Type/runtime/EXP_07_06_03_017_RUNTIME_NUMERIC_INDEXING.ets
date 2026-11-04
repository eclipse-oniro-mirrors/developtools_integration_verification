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
 * @id EXP_07_06_03_017_RUNTIME_NUMERIC_INDEXING
 * @expect runtime
 * @section 7.6.3
 * @design 验证 Record<number, string> 数值索引访问正确
 * @note 运行时用例：验证通过数值索引访问 Record 中的值
 */
function main(): void {
    let map: Record<number, string> = {
        1: 'a',
        2: 'b',
    }
    if (map[1] != 'a') {
        throw new Error('assertion failed: map[1] != a, got ' + map[1])
    }
    if (map[2] != 'b') {
        throw new Error('assertion failed: map[2] != b, got ' + map[2])
    }
console.log('verified')
}

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
 * @id EXP_07_18_037_RUNTIME_TYPEOF_UNION
 * @expect runtime
 * @section 7.18
 * @design 验证 typeof union 类型运行时值
 * @note 运行时用例：union 变量实际类型为 string→"string", 为 int→"int"
 */
function getValue(b: boolean): string | int {
    if (b) {
        return 'hello'
    }
    return 42
}

function main(): void {
    let v: string | int = getValue(true)
    let t: string = typeof v
    if (t != 'string') {
        throw new Error('assertion failed: typeof union(string) = ' + t)
    }

    let w: string | int = getValue(false)
    let tw: string = typeof w
    if (tw != 'int') {
        throw new Error('assertion failed: typeof union(int) = ' + tw)
    }
console.log('verified')
}

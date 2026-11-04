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
 * @id EXP_07_18_036_RUNTIME_TYPEOF_OBJECT_RUNTIME
 * @expect runtime
 * @section 7.18
 * @design 验证 typeof Object 变量运行时值
 * @note 运行时用例：Object 变量值为 string→"string", 值为 int→"int"
 */
function main(): void {
    let o: Object = 'hello'
    let t: string = typeof o
    if (t != 'string') {
        throw new Error('assertion failed: typeof Object(string) = ' + t)
    }

    let p: Object = 42
    let tp: string = typeof p
    if (tp != 'int') {
        throw new Error('assertion failed: typeof Object(int) = ' + tp)
    }
console.log('verified')
}

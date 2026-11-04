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
 * @id EXP_07_07_018_RUNTIME_COPY_SEMANTICS
 * @expect runtime
 * @section 7.7
 * @design 扩展复制语义验证：扩展生成新数组，修改新数组不影响原数组
 * @note 运行时用例：验证扩展始终从原数组复制值
 */
function main(): void {
    let a: int[] = [1, 2, 3]
    let b: int[] = [...a]
    b[0] = 99
    if (a[0] != 1) {
        throw new Error('assertion failed: original modified')
    }
    if (b[0] != 99) {
        throw new Error('assertion failed: copy not modified')
    }
console.log('verified')
}

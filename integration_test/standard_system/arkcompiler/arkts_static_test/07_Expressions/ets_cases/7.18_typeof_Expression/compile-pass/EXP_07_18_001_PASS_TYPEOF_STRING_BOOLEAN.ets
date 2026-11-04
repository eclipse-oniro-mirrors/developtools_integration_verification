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
 * @id EXP_07_18_001_PASS_TYPEOF_STRING_BOOLEAN
 * @expect compile-pass
 * @section 7.18
 * @design 验证 typeof string/boolean 编译通过
 * @note 正向用例：string→"string", boolean→"boolean" 编译通过
 */
function testString(): void {
    let s: string = 'hello'
    let t: string = typeof s
}

function testBoolean(): void {
    let b: boolean = true
    let t: string = typeof b
}

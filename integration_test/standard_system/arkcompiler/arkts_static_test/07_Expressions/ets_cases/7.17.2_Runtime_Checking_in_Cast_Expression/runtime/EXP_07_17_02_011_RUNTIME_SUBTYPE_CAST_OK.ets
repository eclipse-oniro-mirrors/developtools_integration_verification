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
 * @id EXP_07_17_02_011_RUNTIME_SUBTYPE_CAST_OK
 * @expect runtime
 * @section 7.17.2
 * @design 验证子类变量 as 超类运行时成功
 * @note 运行时用例：D 实例 as C (D extends C) 运行时成功，返回原实例
 */
class C {
    public val: int = 0
}
class D extends C {
    public val: int = 42
}

function main(): void {
    let d = new D()
    let c: C = d as C
    if (c.val != 42) {
        throw new Error('assertion failed')
    }
console.log('verified')
}

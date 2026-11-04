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
 * @id EXP_07_06_04_008_RUNTIME_CTOR_ABRUPT
 * @expect runtime
 * @section 7.6.4
 * @design 构造器异常完成验证：构造器抛出 Error，对象字面量求值应提前终止，
 *         不会执行字段表达式
 * @runtime-throws=Error
 * @note 运行时用例：验证构造器异常导致字面量求值终止
 */
let ctorReached: string = ''

class CrashingClass {
    public value: string = ''
    constructor() {
        ctorReached = 'ctor_started'
        throw new Error('constructor failed')
    }
}

function fieldExpr(): string {
    ctorReached = ctorReached + '_field'
    return 'should_not_reach'
}

function main(): void {
    let x: CrashingClass = {value: fieldExpr()}
    throw new Error('unreachable: constructor should have thrown')
}

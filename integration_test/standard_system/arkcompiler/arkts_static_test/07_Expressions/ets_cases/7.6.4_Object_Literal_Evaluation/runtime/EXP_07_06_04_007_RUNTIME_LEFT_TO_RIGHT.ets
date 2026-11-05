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
 * @id EXP_07_06_04_007_RUNTIME_LEFT_TO_RIGHT
 * @expect runtime
 * @section 7.6.4
 * @design 从左到右字段求值顺序验证：使用全局 order 追踪器按字段求值顺序附加标记，
 *         验证先求值左字段表达式再右字段，赋值顺序也对应
 * @note 运行时用例：验证字段表达式从左到右求值
 */
let order: string = ''

class Data {
    public a: string = ''
    public b: string = ''
    public c: string = ''
}

function setA(): string {
    order = order + 'A'
    return 'val_a'
}

function setB(): string {
    order = order + 'B'
    return 'val_b'
}

function setC(): string {
    order = order + 'C'
    return 'val_c'
}

function main(): void {
    order = ''
    let d: Data = {a: setA(), b: setB(), c: setC()}
    if (order != 'ABC') {
        throw new Error('assertion failed: order != ABC, got ' + order)
    }
    if (d.a != 'val_a') {
        throw new Error('assertion failed: a != val_a')
    }
    if (d.b != 'val_b') {
        throw new Error('assertion failed: b != val_b')
    }
    if (d.c != 'val_c') {
        throw new Error('assertion failed: c != val_c')
    }
console.log('verified')
}

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
 * @id GEN_05_01_04_002_PASS_INSTANCEOF_WILDCARD
 * @expect compile-pass
 * @section 5.1.4
 * @design instanceof产生通配符类型编译验证
 * @note 编译验证，运行时入口问题暂不可执行
 */
class X<T> {
    p: T;
    constructor(v: T) { this.p = v; }
}
function bar(x: X<Any>): void {
    x.p = 'a';
}
function main(): void {
    let obj: object = new X<string>('hello');
    if (obj instanceof X) {
    let x: X<Any> = obj as X<Any>;
        bar(x);
        if (x.p != 'a') {
    throw new Error('assertion failed: ' + x.p);
        }
    }
    console.log('verified');
}

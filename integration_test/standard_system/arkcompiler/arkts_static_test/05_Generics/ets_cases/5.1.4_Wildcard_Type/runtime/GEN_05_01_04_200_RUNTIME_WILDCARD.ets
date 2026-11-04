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
 * @id GEN_05_01_04_200_RUNTIME_WILDCARD
 * @expect runtime
 * @section 5.1.4
 * @design 验证通配符类型在运行时行为正确
 * @note 运行时用例：通配符声明后运行时取值类型正确
 */
class Storage<T> {
    private value: T;
    constructor(v: T) { this.value = v; }
    get(): T { return this.value; }
}

function main(): void {
    let s: Storage<string> = new Storage<string>('wildcard_ok');
    let v: string = s.get();
    if (v != 'wildcard_ok') {
    throw new Error('assertion failed: ' + v);
    }
    console.log('verified');
}

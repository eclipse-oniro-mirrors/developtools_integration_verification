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
 * @id GEN_05_02_02_107_RUNTIME_EXPLICIT_INST
 * @expect runtime
 * @section 5.2.2
 * @design 明确实例化运行时
 * @note 运行时用例：验证明确实例化运行时正确
 */
class MyBox4<T> {
    public value: T;
    constructor(v: T) { this.value = v; }
}
function main(): void {
    let b: MyBox4<string> = new MyBox4<string>('hello');
    if (b.value != 'hello') {
    throw new Error('assertion failed: ' + b.value);
    }
    console.log('verified');
}

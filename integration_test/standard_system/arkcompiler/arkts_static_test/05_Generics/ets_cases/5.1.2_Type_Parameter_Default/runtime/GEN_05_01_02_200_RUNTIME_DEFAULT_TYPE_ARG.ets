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
 * @id GEN_05_01_02_200_RUNTIME_DEFAULT_TYPE_ARG
 * @expect runtime
 * @section 5.1.2
 * @design 默认类型参数运行时
 * @note 运行时用例：验证默认类型参数省略时正确使用
 */
class MyBox3<T = number> {
    value: T;
    constructor(v: T) { this.value = v; }
}
function main(): void {
    let b: MyBox3 = new MyBox3(99);
    if (b.value != 99) {
    throw new Error('assertion failed: ' + b.value);
    }
    console.log('verified');
}

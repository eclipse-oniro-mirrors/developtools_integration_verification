/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: default_constructor
// description: class default constructor
// Conversion notes: 源含 `Derived()`（无 new 调用类）抛 TypeError 的负向断言；ArkTS 类不可无 new 调用
// （编译期拒绝，非运行时 TypeError），故仅迁正向断言：`new Derived()` 默认构造器转发 super 至 Base 构造器（calls==1）。

let calls = 0;

class Base {
    constructor() {
        calls++;
    }
}

class Derived extends Base {}

function main(): void {
    let d: Derived = new Derived();
    arktest.assertTrue(calls === 1);
}

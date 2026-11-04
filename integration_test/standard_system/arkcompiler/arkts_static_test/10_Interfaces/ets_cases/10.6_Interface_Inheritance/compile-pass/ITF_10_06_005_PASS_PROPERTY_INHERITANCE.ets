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
 * @id ITF_10_06_005_PASS_PROPERTY_INHERITANCE
 * @expect compile-pass
 * @section 10.6
 * @design 接口继承中的属性合并
 * @note 正向用例：验证规范 §10.6 示例中的属性继承场景
 */
interface I1 {
    prop1: number;
    set prop2(p: number);
    get prop3(): number;
}

interface I2 {
    prop1: number;
    set prop2(p: number);
    get prop3(): number;
}

interface I3 extends I1, I2 {}

class Impl3 implements I3 {
    prop1: number = 0;
    
    set prop2(p: number) {
        this.prop1 = p;
    }
    
    get prop3(): number {
        return this.prop1;
    }
}

function foo(i3: I3): void {
    i3.prop1 = 5;
    let x = i3.prop1;
    i3.prop2 = 5;
    let y = i3.prop3;
}

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
 * @id ITF_10_02_200_RUNTIME_MULTI_LEVEL_EXTENDS
 * @expect runtime
 * @section 10.2
 * @design 多层接口继承运行时方法调用
 * @note 运行时用例：验证通过多层继承链调用方法正确
 */
interface A {
    foo(): number;
}
interface B extends A {
    bar(): number;
}
interface C extends B {
    baz(): number;
}
class Impl implements C {
    foo(): number { return 1; }
    bar(): number { return 2; }
    baz(): number { return 3; }
}
function main(): void {
    let c: C = new Impl();
    if (c.foo() != 1) { throw new Error("foo failed"); }
    if (c.bar() != 2) { throw new Error("bar failed"); }
    if (c.baz() != 3) { throw new Error("baz failed"); }
    console.log("verified");
}

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
 * @id SEM_15_07_02_102_FAIL_unexpressible_smart_return
 * @expect compile-pass
 * @section 15.7.2
 * @design 规范 15.7.2：推断返回类型为C&I无法表达时报错
 * @note 反向用例：instanceof ternary返回c: C或new D()产生C&I交集类型
 */
class C {}
interface I {}
class D extends C implements I {}
function foo(c: C) {
    return c instanceof I ? c : new D();
}
function main(): void {
    let r = foo(new D());
}


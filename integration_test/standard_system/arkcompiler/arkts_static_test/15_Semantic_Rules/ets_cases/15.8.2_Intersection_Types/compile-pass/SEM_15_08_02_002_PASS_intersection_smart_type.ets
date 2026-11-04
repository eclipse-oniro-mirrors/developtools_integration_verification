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
 * @id SEM_15_08_02_002_PASS_intersection_smart_type
 * @expect compile-pass
 * @section 15.8.2
 * @design 规范 15.8.2：instanceof缩窄后交集类型I&C的智能类型
 * @note 正向用例：i instanceof C后调用i.foo()和i.bar()
 */
interface I {
    bar(): void;
}
class C implements I {
    foo(): void {}
    bar(): void {}
}
function test(i: I): void {
    if (i instanceof C) {
        i.foo();
        i.bar();
    }
}
function main(): void {
    test(new C());
}

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
 * @id SEM_15_08_07_005_PASS_overload_smart_cast
 * @expect compile-pass
 * @section 15.8.7
 * @design 规范 15.8.7：智能类型影响重载决议
 * @note 正向用例：a:Base=new Base调fooBase, b:Base=new Derived调fooDerived
 */
class Base {
    public b: int = 1;
}
class Derived extends Base {
    public d: int = 2;
}
function fooBase(p: Base): void {}
function fooDerived(p: Derived): void {}
overload foo { fooDerived, fooBase }
function too(): void {
    let a: Base = new Base();
    foo(a);
    let b: Base = new Derived();
    foo(b);
}
function main(): void {
    too();
}

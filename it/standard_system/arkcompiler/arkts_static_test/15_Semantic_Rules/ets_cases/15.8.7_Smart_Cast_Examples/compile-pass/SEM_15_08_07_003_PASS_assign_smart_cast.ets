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
 * @id SEM_15_08_07_003_PASS_assign_smart_cast
 * @expect compile-pass
 * @section 15.8.7
 * @design 规范 15.8.7：new Derived初始化Base变量后调用Derived方法
 * @note 正向用例：let b: Base=new Derived后b.method()安全
 */
class Base {}
class Derived extends Base {
    method(): void {}
}
function goo(): void {
    let b: Base = new Derived();
    b.method();
}
function main(): void {
    goo();
}

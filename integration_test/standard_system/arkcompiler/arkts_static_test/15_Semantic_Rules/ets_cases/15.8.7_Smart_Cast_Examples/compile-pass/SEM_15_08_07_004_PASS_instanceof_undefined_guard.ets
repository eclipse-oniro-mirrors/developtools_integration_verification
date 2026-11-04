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
 * @id SEM_15_08_07_004_PASS_instanceof_undefined_guard
 * @expect compile-pass
 * @section 15.8.7
 * @design 规范 15.8.7：instanceof和undefined守卫后安全调用方法
 * @note 正向用例：b instanceof Base和d!=undefined后调用method
 */
class Base {
    method(): void {
        console.log('verified');
    }
}
class Derived extends Base {
    method(): void {
        console.log('verified');
    }
}
function foo(b: Base | null, d: Derived | undefined): void {
    if (b instanceof Base) {
        b.method();
    }
    if (d != undefined) {
        d.method();
    }
}
function main(): void {
    foo(new Base(), new Derived());
    foo(null, undefined);
}

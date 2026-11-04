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
 * @id SEM_15_10_02_005_PASS_generic_class_equiv_first
 * @expect compile-pass
 * @section 15.10.2
 * @design Generic instantiation leads to overload-equivalent methods, textually first called
 * @note Spec lines 60-79: Template<T> with foo(T)/foo(number), bar(number)/bar(T)
 */
class Template<T> {
    foo(p: T): void {
        console.log('generic foo')
    }
    foo(p: number): void {
        console.log('plain foo')
    }
    bar(p: number): void {
        console.log('plain bar')
    }
    bar(p: T): void {
        console.log('generic bar')
    }
}
function main(): void {
    let instantiation: Template<number> = new Template<number>()
    instantiation.foo(1)
    instantiation.bar(1)
}

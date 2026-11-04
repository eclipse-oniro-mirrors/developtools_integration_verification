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
 * @id SEM_15_11_02_102_FAIL_overload_set_functions
 * @expect compile-fail
 * @section 15.11.2
 * @design Overload set formation and resolution for functions with explicit overload
 * @note Spec lines 14-50
 */
function fooN(n: number): void { console.log('fooN')
}
function foo(): void { console.log('foo#1')
}
function foo(b: boolean): void { console.log('foo#2')
}
function fooX(x?: number): void { console.log('fooX')
}
overload foo { fooN, foo, fooX }
overload bar { fooX, foo }
function main(): void {
    foo(1)
    bar(1)
    foo()
    bar()
    foo(true)
    bar(true)
}

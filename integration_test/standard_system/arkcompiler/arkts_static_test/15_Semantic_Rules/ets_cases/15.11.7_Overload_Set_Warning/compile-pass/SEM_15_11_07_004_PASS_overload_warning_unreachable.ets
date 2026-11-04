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
 * @id SEM_15_11_07_004_PASS_overload_warning_unreachable
 * @expect compile-pass
 * @section 15.11.7
 * @design Overload set warning when an entity can never be selected (f3 never called)
 * @note Spec lines 12-24
 */
function f1(p: number): void { console.log('f1')
}
function f2(p: number | string): void { console.log('f2')
}
function f3(p: string): void { console.log('f3')
}
overload foo { f1, f2, f3 }
function main(): void {
    foo(5)
    foo('5')
}

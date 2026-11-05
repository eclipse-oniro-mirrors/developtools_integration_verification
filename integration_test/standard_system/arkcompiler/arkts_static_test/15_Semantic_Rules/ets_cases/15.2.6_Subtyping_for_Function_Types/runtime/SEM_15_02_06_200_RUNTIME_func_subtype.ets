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
 * @id SEM_15_02_06_200_RUNTIME_func_subtype
 * @expect runtime
 * @section 15.2.6
 * @design 函数类型子类型运行时
 * @note 运行时用例
 */
class A { public name: string= ''; }
class D extends A { public breed: string= ''; }
function use(fn: (d: D) => string): string { let d: D = new D(); d.name = 'x'; return fn(d); }
function handler(a: A): string { return a.name; }
function main(): void {
let r = use(handler);
if (r != 'x') {
    throw new Error('fail');
  }
console.log('verified');
};
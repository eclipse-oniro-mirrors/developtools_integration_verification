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
 * @id SEM_15_11_08_002_PASS_subtype_param_selects_overload
 * @expect compile-pass
 * @section 15.11.8
 * @design 子类型参数选择合适重载
 * @note ⽐正向用例
 */
class Base { public name: string = ''; }
class Derived extends Base { public extra: int = 0; }
function handle(x: Base): string { return 'base'; }
function handle(x: Derived): string { return 'derived'; }
function main(): void {
    let d: Derived = new Derived();
    console.log(handle(d));
}

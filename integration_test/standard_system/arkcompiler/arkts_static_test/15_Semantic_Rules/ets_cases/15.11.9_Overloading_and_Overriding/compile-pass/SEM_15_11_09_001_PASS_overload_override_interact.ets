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
 * @id SEM_15_11_09_001_PASS_overload_override_interact
 * @expect compile-pass
 * @section 15.11.9
 * @design 重载与覆写交互：子类同时重载和覆写
 * @note 正向用例：Derived 覆写 process(int) 并增加 process(string) 重载
 */
class Base { process(x: int): string { return 'base'; } }
class Derived extends Base {
    override process(x: int): string { return 'derived'; }
    process(x: string): string { return 'str'; }
}
function main(): void {
    let d: Derived = new Derived();
    console.log(d.process(42));
}

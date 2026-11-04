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
 * @id SEM_15_11_05_002_PASS_instance_method_multi_params
 * @expect compile-pass
 * @section 15.11.5
 * @design 实例方法多参数组合
 * @note ⽐正向用例
 */
class Finder {
    find(key: int): string { return 'id'; }
    find(name: string): string { return 'name'; }
}
function main(): void {
    let f: Finder = new Finder();
    console.log(f.find(1) + f.find('x'));
}

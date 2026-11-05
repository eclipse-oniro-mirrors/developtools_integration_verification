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
 * @id SEM_15_11_03_002_PASS_interface_method_overloads
 * @expect compile-pass
 * @section 15.11.3
 * @design 接口方法重载集
 * @note ⽐正向用例
 */
class Runner {
    run(): string { return 'run'; }
    run(x: int): string { return 'run' + x.toString(); }
}
function main(): void {
    let r: Runner = new Runner();
    console.log(r.run() + r.run(1));
}

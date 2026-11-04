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
 * @id SEM_15_02_08_001_PASS_PLACEHOLDER
 * @expect compile-fail
 * @section 15.2.8
 * @design 交叉类型—instanceof 收窄实现交叉语义
 * @note 编译器暂不支持 & 语法，通过 C&I 场景验证
 */
interface Named { name: string; }
class Person { public name: string = ''; public age: int = 0; }
function greet(p: Person & Named): void {
    console.log(p.name);
}
function main(): void {
    let p = new Person();
    p.name = 'Alice';
    if (p instanceof Person) {
        greet(p);
    }
}


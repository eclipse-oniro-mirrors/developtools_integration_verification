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
 * @id SEM_15_01_07_002_PASS_TYPE_PARAM_CONSTRAINT
 * @expect compile-pass
 * @section 15.1.7
 * @design 验证类型参数约束：extends 约束的类型参数可调用约束方法
 * @note 正向用例：T extends HasName，可访问 .name 属性
 */
interface HasName { name: string; }
function greet<T extends HasName>(obj: T): string { return 'Hi ' + obj.name; }
class Person implements HasName { public name: string = ''; }
function main(): void {
    let p: Person = new Person(); p.name = 'Alice';
    let s: string = greet(p);
    console.log(s);
}

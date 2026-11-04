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
 * @id EXP2_17_13_5_001_PASS_EXPLICIT_THIS_MEMBER_ACCESS
 * @expect compile-pass
 * @section 17.13.5
 * @design 显式 this 访问接收者成员：在接收者lambda体内使用 this.field 访问成员
 * @note 正向用例：验证该特性编译通过的正确用法。es2panda 要求使用显式 this. 前缀
 */
class Employee { public name: string = ''; public salary: number = 0 }
function testExplicitThisAccess(): void {
  let describe = (this: Employee): string => { return this.name + ' earns ' + this.salary }
  let emp: Employee = new Employee(); emp.name = 'Alice'; emp.salary = 50000
  let desc: string = describe(emp)
  console.log('compiled successfully')
}

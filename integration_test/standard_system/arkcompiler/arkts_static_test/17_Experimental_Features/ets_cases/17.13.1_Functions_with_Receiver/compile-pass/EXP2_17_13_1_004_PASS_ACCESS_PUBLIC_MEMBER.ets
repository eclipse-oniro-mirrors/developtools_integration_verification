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
 * @id EXP2_17_13_1_004_PASS_ACCESS_PUBLIC_MEMBER
 * @expect compile-pass
 * @section 17.13.1
 * @design 接收者函数通过 this 访问公有成员变量
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class DataObject { public name: string = 'unnamed'; public age: number = 0 }
function describe(this: DataObject): string { return this.name + ' is ' + this.age + ' years old' }
function testAccessPublicMember(): void {
  let obj: DataObject = new DataObject()
  obj.name = 'Alice'; obj.age = 30
  let desc: string = obj.describe()
  console.log('compiled successfully')
}

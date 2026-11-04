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
 * @id EXP2_17_13_4_004_PASS_LAMBDA_ACCESS_RECEIVER_MEMBERS
 * @expect compile-pass
 * @section 17.13.4
 * @design lambda内通过this访问接收者的公有成员
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Person { public firstName: string = ''; public lastName: string = '' }
function testLambdaAccessMembers(): void {
  let fullName = (this: Person): string => { return this.firstName + ' ' + this.lastName }
  let p: Person = new Person(); p.firstName = 'John'; p.lastName = 'Doe'
  let name: string = fullName(p)
  console.log('compiled successfully')
}

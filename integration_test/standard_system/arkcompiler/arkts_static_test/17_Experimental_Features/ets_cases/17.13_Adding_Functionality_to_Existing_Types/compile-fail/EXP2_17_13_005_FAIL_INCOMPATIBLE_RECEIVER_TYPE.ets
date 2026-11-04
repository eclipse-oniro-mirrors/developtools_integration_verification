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
 * @id EXP2_17_13_005_FAIL_INCOMPATIBLE_RECEIVER_TYPE
 * @expect compile-fail
 * @section 17.13
 * @design 接收者类型不兼容：方法调用语法的接收者类型与函数定义的 this 类型不匹配
 * @note 反向用例：验证该场景应产生编译时错误
 */
class Dog { public name: string = 'dog' }
class Cat { public name: string = 'cat' }
function bark(this: Dog): string { return this.name + ' barks' }
function testIncompatibleReceiver(): void {
  let c: Cat = new Cat()
  let result: string = c.bark()
}

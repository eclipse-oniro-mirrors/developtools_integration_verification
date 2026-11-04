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
 * @id EXP2_17_13_3_004_PASS_ASSIGN_LAMBDA_TO_RECEIVER_FUNC_TYPE
 * @expect compile-pass
 * @section 17.13.3
 * @design 将带接收者的lambda赋值给带接收者的函数类型变量，通过普通调用使用
 * @note 正向用例：验证该特性编译通过的正确用法
 */
interface Tagged { tag: string }
class Item implements Tagged { public tag: string = 'untagged'; public id: number = 0 }
type Tagger = (this: Tagged, newTag: string) => void
function testAssignLambda(): void {
  let tagger: Tagger = (this: Tagged, newTag: string): void => { this.tag = newTag }
  let item: Item = new Item()
  tagger(item, 'Important')
  console.log('compiled successfully')
}

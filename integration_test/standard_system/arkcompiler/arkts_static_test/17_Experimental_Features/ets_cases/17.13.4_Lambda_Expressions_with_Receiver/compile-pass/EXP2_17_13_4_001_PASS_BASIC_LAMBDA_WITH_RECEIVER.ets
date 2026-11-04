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
 * @id EXP2_17_13_4_001_PASS_BASIC_LAMBDA_WITH_RECEIVER
 * @expect compile-pass
 * @section 17.13.4
 * @design 基本带接收者的lambda表达式定义，通过普通调用语法使用
 * @note 正向用例：验证该特性编译通过的正确用法。es2panda 不支持对 lambda 变量使用方法调用语法
 */
class Greeter { public name: string = 'World' }
type GreetFunc = (this: Greeter) => string
function testBasicLambdaReceiver(): void {
  let greet: GreetFunc = (this: Greeter): string => { return 'Hello ' + this.name }
  let g: Greeter = new Greeter(); g.name = 'ArkTS'
  let msg: string = greet(g)
  console.log('compiled successfully')
}

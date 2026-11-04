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
 * @id EXP2_17_13_5_006_FAIL_AMBIGUOUS_RECEIVER_AND_OUTER
 * @expect compile-fail
 * @section 17.13.5
 * @design 接收者lambda中省略this访问与外部同名的成员应产生编译错误（使用隐式this需要编译器支持）
 * @note 反向用例：验证该场景应产生编译时错误（es2panda 不支持隐式 this，需要显式 this. 前缀）
 */
let gTitle: string = 'global title'
class Article { public title: string = 'article title' }
function testAmbiguous(): void {
  let printer = (this: Article): string => { return title }
  let a: Article = new Article()
  let r: string = printer(a)
}

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
 * @id EXP2_17_11_3_006_FAIL_CTOR_NAME_AS_REF
 * @expect compile-fail
 * @section 17.11.3
 * @design 构造函数名作为属性引用：验证将命名构造函数名作为属性引用产生编译错误
 * @note 反向用例：验证 Foo.Bar 作为属性访问产生 ESE0087 编译错误
 */
class Foo {
  constructor Bar() {
    console.log('Bar')
  }
}

function testCtorNameAsRef(): void {
  let f = Foo.Bar
  console.log(f)
}

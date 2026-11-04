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
 * @id EXP2_17_11_3_009_FAIL_ALL_NAMED_WRONG_ARGS
 * @expect compile-fail
 * @section 17.11.3
 * @design 全命名构造函数且参数不匹配：验证类只有命名构造函数时，无参调用产生编译错误
 * @note 反向用例：验证全命名构造函数需要匹配参数
 */
class Foo {
  constructor First(n: int) {
    console.log('First')
  }
  constructor Second(s: string) {
    console.log('Second')
  }
  overload constructor { First, Second }
}

function testAllNamedWrongArgs(): void {
  let x: Foo = new Foo()
  console.log('done')
}

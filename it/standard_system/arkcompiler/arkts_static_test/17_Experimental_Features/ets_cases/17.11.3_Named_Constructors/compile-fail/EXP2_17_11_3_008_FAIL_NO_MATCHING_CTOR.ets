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
 * @id EXP2_17_11_3_008_FAIL_NO_MATCHING_CTOR
 * @expect compile-fail
 * @section 17.11.3
 * @design 调用参数不匹配任何命名构造函数：验证 new Class(args) 参数不匹配时产生编译错误
 * @note 反向用例：验证无匹配构造函数时产生 ESE0124/ESE0127 编译错误
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

function testNoMatchingCtor(): void {
  let x: Foo = new Foo(true)
  console.log('done')
}

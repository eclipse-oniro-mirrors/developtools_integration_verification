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
 * @id EXP2_17_11_3_007_FAIL_TWO_OVERLOAD_BLOCKS
 * @expect compile-fail
 * @section 17.11.3
 * @design 两个 overload constructor 块：验证同一个类中声明两个 overload constructor 块产生编译错误
 * @note 反向用例：验证重复的 overload constructor 声明产生编译错误
 */
class Foo {
  constructor First() {
    console.log('First')
  }
  overload constructor { First }
  overload constructor { First }
}

function testTwoOverloadBlocks(): void {
  let f: Foo = new Foo()
  console.log('done')
}

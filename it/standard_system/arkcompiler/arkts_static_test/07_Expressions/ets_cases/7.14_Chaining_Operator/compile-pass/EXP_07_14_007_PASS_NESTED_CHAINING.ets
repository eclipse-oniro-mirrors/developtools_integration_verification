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
 * @id EXP_07_14_007_PASS_NESTED_CHAINING
 * @expect compile-pass
 * @section 7.14
 * @design 验证多层嵌套链式操作符：a?.b?.c?.d 编译通过
 * @note 正向用例：嵌套 ?. 链式访问，编译通过
 */
class Inner {
  public value: int = 42;
}

class Middle {
  public inner?: Inner = undefined;
}

class Outer {
  public middle?: Middle = undefined;
}

function main(): void {
  let o: Outer | undefined = new Outer();
  let v: int | undefined = o?.middle?.inner?.value;
}

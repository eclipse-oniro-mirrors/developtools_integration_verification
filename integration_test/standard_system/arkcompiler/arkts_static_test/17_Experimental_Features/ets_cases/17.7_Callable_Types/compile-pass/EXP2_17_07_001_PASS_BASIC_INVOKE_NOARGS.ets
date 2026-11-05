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
 * @id EXP2_17_07_001_PASS_BASIC_INVOKE_NOARGS
 * @expect compile-pass
 * @section 17.7
 * @design 类声明 static $_invoke(): int 后，类名可直接作为函数调用 C()，等价于 C.$_invoke()
 * @note 正向用例：验证静态 $_invoke 无参使类变为可调用，编译通过
 */
class SimpleCallable {
  static $_invoke(): int {
    return 42
  }
}

function testCallable(): void {
  let r: int = SimpleCallable()
  let r2: int = SimpleCallable.$_invoke()
}

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
 * @id EXP2_17_07_005_PASS_MULTIPLE_INVOKE_OVERLOADS
 * @expect compile-pass
 * @section 17.7
 * @design 类可拥有多个不同签名的 $_invoke 重载实现
 * @note 正向用例：验证多个 $_invoke 重载（不同参数数量）编译通过
 */
class OverloadedInvoke {
  static $_invoke(): int {
    return 0
  }
  static $_invoke(a: int): int {
    return a
  }
  static $_invoke(a: int, b: int): int {
    return a + b
  }
}

function testOverloadedInvoke(): void {
  let r0: int = OverloadedInvoke()
  let r1: int = OverloadedInvoke(5)
  let r2: int = OverloadedInvoke(3, 7)
}

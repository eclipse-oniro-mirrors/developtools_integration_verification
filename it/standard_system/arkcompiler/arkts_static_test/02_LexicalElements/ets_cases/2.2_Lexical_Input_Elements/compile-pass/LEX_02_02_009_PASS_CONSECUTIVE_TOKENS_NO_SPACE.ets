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
 * @id LEX_02_02_009_PASS_CONSECUTIVE_TOKENS_NO_SPACE
 * @expect compile-pass
 * @section 2.2
 * @design 连续Token(运算符、括号)无需空白分隔: a+b, foo(), arr[0] * @note 正向用例：验证该特性编译通过的正确用法

 */
function testConsecutiveTokensNoSpace(): void {
  let a: int = 5
  let b: int = 3
  let c: int = a+b
  let d: int = (a+b)*2
  let arr: int[] = [1,2,3]
  let e: int = arr[0]
}

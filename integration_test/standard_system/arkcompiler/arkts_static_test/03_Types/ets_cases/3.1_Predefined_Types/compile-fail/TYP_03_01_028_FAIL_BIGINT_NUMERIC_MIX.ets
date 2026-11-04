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
 * @id TYP_03_01_028_FAIL_BIGINT_NUMERIC_MIX
 * @expect compile-fail
 * @section 3.1
 * @design bigint 与数值类型非法混用应编译失败: bigint + int、bigint + int 字面量、bigint == int、bigint 与 int 互赋值
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testBigintInvalidOpsFail(): void {
  let b: bigint = 123n
  let n: int = 456

  let sum: bigint = b + n

  let mixed: bigint = b + 456

  let cmp: boolean = b == n

  let assign: bigint = n
  let assign2: int = b
}
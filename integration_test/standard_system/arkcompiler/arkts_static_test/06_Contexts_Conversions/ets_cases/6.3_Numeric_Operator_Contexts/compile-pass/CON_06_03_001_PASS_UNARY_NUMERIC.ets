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
 * @id CON_06_03_001_PASS_UNARY_NUMERIC
 * @expect compile-pass
 * @section 6.3
 * @design 一元表达式: +int, -long, ~byte 等一元运算符对数值类型
 * @note 正向用例：验证一元数值运算编译通过
 */
function testUnaryNumeric(): void {
  let a: int = 10
  let r1: int = +a
  let r2: int = -a
  let r3: int = ~a

  let b: long = 100
  let r4: long = -b
  let r5: long = ~b

  let c: byte = 5
  let r6: int = -c
}

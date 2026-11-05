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
 * @id CON_06_02_002_PASS_FLOAT_STRING_CONCAT
 * @expect compile-pass
 * @section 6.2
 * @design String context: 浮点类型(double/float) + string，十进制形式不丢失信息
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testFloatStringConcat(): void {
  let s1: string = 'pi: ' + 3.14
  let s2: string = 2.72 + ' (e)'
  let s3: string = 'zero: ' + 0.0

  let d: double = 1.5
  let s4: string = d + ' is double'
  let s5: string = 'double: ' + d
}

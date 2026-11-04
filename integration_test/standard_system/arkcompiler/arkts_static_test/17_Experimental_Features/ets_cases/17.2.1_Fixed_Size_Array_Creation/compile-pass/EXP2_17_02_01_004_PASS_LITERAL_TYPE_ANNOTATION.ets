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
 * @id EXP2_17_02_01_004_PASS_LITERAL_TYPE_ANNOTATION
 * @expect compile-pass
 * @section 17.2.1
 * @design FixedArray 通过 Array Literal 创建（显式类型注解）：验证 let a: FixedT[] = [...] 正确编译
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testLiteralTypeAnnotation(): void {
  let a: Fixednumber[] = [1, 2, 3]
  let b: Fixedstring[] = ['hello', 'world']
  let c: Fixedint[] = [10, 20, 30, 40]
  console.log(a[0])
  console.log(b[1])
  console.log(c.length)
}

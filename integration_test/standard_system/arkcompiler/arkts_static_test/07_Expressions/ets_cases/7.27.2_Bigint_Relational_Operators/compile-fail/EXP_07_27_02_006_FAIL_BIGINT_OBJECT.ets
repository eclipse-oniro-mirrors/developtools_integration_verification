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
 * @id EXP_07_27_02_006_FAIL_BIGINT_OBJECT
 * @expect compile-fail
 * @section 7.27.2
 * @design 验证bigint类型与Object类型操作数不能用于关系运算符，应产生编译时错误（bigint无法转换为Object进行关系比较）
 *  * @note 反向用例：验证该场景应产生编译时错误
 */
function testBigintObject(): void {
  let bi: bigint = 42n
  let obj: Object = {x: 1}
  let r: boolean = bi <= obj  // compile-fail: bigint <= Object, incompatible
  console.log(r.toString())
}

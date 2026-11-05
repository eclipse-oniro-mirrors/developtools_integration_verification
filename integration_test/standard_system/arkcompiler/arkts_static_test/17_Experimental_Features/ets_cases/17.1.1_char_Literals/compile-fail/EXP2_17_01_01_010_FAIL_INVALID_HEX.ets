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
 * @id EXP2_17_01_01_010_FAIL_INVALID_HEX
 * @expect compile-fail
 * @section 17.1.1
 * @design 非法十六进制转义 c'\xGG' 应产生编译时错误（G 不是有效十六进制数字）
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testInvalidHexFail(): void {
  let invalidHex: char = c'\xGG'
  console.log(invalidHex)
}

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
 * @id LEX_02_06_032_FAIL_UESCAPE_DIGIT_START
 * @expect compile-fail
 * @section 2.6
 * @design \u 转义解码为数字字符（如 \u0030 = '0'）作为起始应失败
 * @note 反向用例：\u0030abc 实际等价于 0abc，非法
 */
function testUEscapeDigitStart(): void {
  let \u0030abc: int = 1
}

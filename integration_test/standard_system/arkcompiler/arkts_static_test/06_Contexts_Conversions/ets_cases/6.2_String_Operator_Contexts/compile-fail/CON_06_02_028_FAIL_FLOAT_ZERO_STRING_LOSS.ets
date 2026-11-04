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
 * @id CON_06_02_028_FAIL_FLOAT_ZERO_STRING_LOSS
 * @expect compile-fail
 * @section 6.2
 * @design 浮点零 string 转换丢失 .0：0.0 → "0" 而非 "0.0"
 * @note ⚠️ SPEC 不一致：spec §6.2 要求 "without the loss of information"
 *       原 CON_06_02_017 被改为 1.0 规避此问题
 */
function testFloatZeroStringLoss(): void {
  let s: string = 0.0 + ' is zero'
  if (s != '0.0 is zero') {}
}

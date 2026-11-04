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
 * @id LEX_02_01_037_PASS_UNICODE_ARRAY_GENERIC
 * @expect compile-pass
 * @section 2.1
 * @design 测试因子checklist: 数组/tuple元素 - Unicode字符串在数组中的存取
 * @note 正向用例：验证Unicode在数组中正确使用（Map/Set需要泛型参数，暂不测试）
 */
function main(): void {
  let 中文数组: string[] = ["苹果", "香蕉", "橘子"]
  let 第一个: string = 中文数组[0]
  let 长度: number = 中文数组.length
}
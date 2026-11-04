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
 * @id EXP_07_32_02_013_RUNTIME_COMPOUND_ARRAY
 * @expect runtime
 * @section 7.32.2
 * @design 闁轰焦澹嗙划宥夊礂閸愵亞顦卞璺虹Т閹海鎸х€ｎ亖鍋?

 * @note 閺夆晜鍔橀、鎴﹀籍閸撲焦鏆忓〒姘儜缁辨壆鈧湱鍋ゅ顖炲箥瑜戦、鎴烆殽瀹€鍐闁轰焦澹嗙划宥嗗緞瀹ュ懏鍊ら悹褍顑呴埀?
 */
function main(): void {
  let arr: int[] = [1, 2, 3]
  arr[0] += 10
  if (arr[0] != 11) {
    throw new Error('assertion failed: arr[0] += 10')
  }
console.log('verified')
}

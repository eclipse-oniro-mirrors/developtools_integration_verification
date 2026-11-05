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
 * @id EXP2_17_04_01_010_FAIL_CONST_NEGATIVE_DIM
 * @expect compile-fail
 * @section 17.4.1
 * @design 常量负维度表达式：验证编译期常量负维度产生 compile-time error
 * @note 反向用例：new int[-3] (0) 应在编译时被拒绝
 */
function testConstNegativeDimFail(): void {
  let arr: int[] = new int[-3] (0)
  console.log(arr.length)
}

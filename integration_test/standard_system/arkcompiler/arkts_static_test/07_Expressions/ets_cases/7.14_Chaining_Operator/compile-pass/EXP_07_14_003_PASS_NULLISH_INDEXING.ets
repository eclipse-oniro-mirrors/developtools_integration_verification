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
 * @id EXP_07_14_003_PASS_NULLISH_INDEXING
 * @expect compile-pass
 * @section 7.14
 * @design 验证可空数组的索引链式操作符：arr?.[0] 结果类型为 undefined|T
 * @note 正向用例：arr?.[0] 其中 arr 为 int[]|undefined，结果类型 int|undefined
 */
function main(): void {
  let arr: int[] | undefined = [10, 20, 30];
  let val: int | undefined = arr?.[0];
}

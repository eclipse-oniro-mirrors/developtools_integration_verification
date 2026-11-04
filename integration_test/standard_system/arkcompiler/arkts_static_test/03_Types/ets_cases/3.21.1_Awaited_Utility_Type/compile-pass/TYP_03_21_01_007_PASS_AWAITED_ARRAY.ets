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
 * @id TYP_03_21_01_007_PASS_AWAITED_ARRAY
 * @expect compile-pass
 * @section 3.21.1
 * @design Awaited<Promise<Array<Promise<number>>>> → Array<Promise<number>>
 * @note 正向用例：数组内 Promise 不展开
 */
type G = Awaited<Promise<Array<Promise<number>>>>

function testAwaitedArray(): void {
  let p: Promise<number> = Promise.resolve(3.14)
  let g: G = [p]
}
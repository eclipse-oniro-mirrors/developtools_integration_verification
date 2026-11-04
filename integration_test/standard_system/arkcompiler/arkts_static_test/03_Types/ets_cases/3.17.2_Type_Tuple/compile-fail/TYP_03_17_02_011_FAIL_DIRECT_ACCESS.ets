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
 * @id TYP_03_17_02_011_FAIL_DIRECT_ACCESS
 * @expect compile-fail
 * @section 3.17.2
 * @design 验证 Tuple 类型值不能直接通过索引访问元素（spec/types.md:1250）
 * @note 反向用例：Tuple 值的元素不能直接访问，必须用 unsafeGet
 */
let pair: [number, string] = [1, "abc"]
let t: Tuple = pair
let x = t[0]
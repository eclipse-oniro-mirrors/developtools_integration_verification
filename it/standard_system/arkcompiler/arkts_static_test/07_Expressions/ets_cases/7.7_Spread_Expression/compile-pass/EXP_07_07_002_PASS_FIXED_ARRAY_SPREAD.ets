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
 * @id EXP_07_07_002_PASS_FIXED_ARRAY_SPREAD
 * @expect compile-pass
 * @section 7.7
 * @design 固定长度数组扩展：Fixedint[] 在字面量中扩展
 * @note 正向用例：验证 FixedArray 扩展语法
 */
let arr: Fixedint[] = [4, 5]
let result: int[] = [...arr]

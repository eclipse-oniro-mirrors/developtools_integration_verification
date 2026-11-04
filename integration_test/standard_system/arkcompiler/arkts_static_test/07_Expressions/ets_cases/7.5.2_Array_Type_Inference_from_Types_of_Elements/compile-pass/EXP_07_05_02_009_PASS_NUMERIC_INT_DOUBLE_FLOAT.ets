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
 * @id EXP_07_05_02_009_PASS_NUMERIC_INT_DOUBLE_FLOAT
 * @expect compile-pass
 * @section 7.5.2
 * @design 多种数值类型混合（int + double）：let j = [1, 1.5, 3] 推断为 number[]
 * @note 正向用例：验证 int 和 double 混合推断为 number[]
 */
let j = [1, 1.5, 3]

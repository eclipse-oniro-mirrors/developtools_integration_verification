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
 * @id EXP_07_17_01_009_FAIL_WRONG_ELEMENT_TYPE
 * @expect compile-fail
 * @section 7.17.1
 * @design 验证数组字面量 as double[] 元素类型不匹配编译时错误
 * @note 反向用例：数组元素类型不可赋值给目标数组元素类型
 */
let x = [1, 'cc'] as double[]

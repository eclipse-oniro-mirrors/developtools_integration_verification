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
 * @id EXP_07_17_01_010_FAIL_WRONG_TUPLE_ELEMENT
 * @expect compile-fail
 * @section 7.17.1
 * @design 验证元组 as 转换时元素类型不匹配编译时错误
 * @note 反向用例：元组元素类型不可赋值给目标元组对应位置类型
 */
let t = [1.0, 'cc'] as [int, string]

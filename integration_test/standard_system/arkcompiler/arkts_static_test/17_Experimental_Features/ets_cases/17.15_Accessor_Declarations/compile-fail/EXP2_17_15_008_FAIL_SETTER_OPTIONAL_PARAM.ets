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
 * @id EXP2_17_15_008_FAIL_SETTER_OPTIONAL_PARAM
 * @expect compile-fail
 * @section 17.15
 * @design Setter 参数使用可选类型声明（v?: int），应编译失败
 * @note 反向用例：spec 规定 setter 不能有可选参数
 *        编译器报 ESY13534: Setter cannot have optional parameter
 */
let g_value: int = 0

set myValue(v?: int) {
  g_value = v
}

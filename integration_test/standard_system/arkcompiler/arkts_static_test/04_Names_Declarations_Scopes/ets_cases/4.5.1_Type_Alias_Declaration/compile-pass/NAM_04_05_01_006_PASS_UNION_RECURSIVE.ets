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
 * @id NAM_04_05_01_006_PASS_UNION_RECURSIVE
 * @expect compile-pass
 * @section 4.5.1
 * @design 联合类型中递归类型别名（Array<D>作为类型参数）
 * @note 正向用例：验证 type D = string | Array<D> 合法递归编译通过（spec 4.5.1 行503）
 */
type D = string | Array<D>

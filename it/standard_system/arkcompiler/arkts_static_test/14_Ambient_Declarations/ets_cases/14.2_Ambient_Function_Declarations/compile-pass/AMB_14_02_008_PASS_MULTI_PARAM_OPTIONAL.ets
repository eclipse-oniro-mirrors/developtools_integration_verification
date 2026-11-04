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
 * @id AMB_14_02_008_PASS_MULTI_PARAM_OPTIONAL
 * @expect compile-pass
 * @section 14.2
 * @design declare function 必选参数+可选参数混合，返回 boolean
 * @note 正向用例：验证 ambient function 混合参数声明编译通过
 */
declare function multi(a: int, b?: string): boolean

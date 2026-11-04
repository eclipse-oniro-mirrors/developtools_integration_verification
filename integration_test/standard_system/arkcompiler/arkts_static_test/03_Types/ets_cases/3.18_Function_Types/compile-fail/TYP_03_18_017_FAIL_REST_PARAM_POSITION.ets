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
 * @id TYP_03_18_017_FAIL_REST_PARAM_POSITION
 * @expect compile-fail
 * @section 3.18
 * @design 函数类型中 rest 参数必须在最后，否则编译时错误
 * @note 反向用例：rest 参数后跟其他参数
 */
// rest 参数后跟必选参数应产生编译时错误
type BadRest1 = (...nums: int[], x: string) => void
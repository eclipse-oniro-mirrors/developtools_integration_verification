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
 * @id EXP_07_09_007_FAIL_THIS_TOP_LEVEL
 * @expect compile-fail
 * @section 7.9
 * @design 顶层作用域中使用 this：this 在类/接口外使用，应报编译时错误
 * @note 反向用例：验证顶层作用域的 this 引用应产生编译时错误
 */
let x: int = this.value

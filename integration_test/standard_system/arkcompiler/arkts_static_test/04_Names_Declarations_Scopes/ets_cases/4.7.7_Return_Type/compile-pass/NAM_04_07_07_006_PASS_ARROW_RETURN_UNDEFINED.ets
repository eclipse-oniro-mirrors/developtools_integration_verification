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
 * @id NAM_04_07_07_006_PASS_ARROW_RETURN_UNDEFINED
 * @expect compile-pass
 * @section 4.7.7
 * @design 箭头函数声明undefined返回类型空体
 * @note 正向用例：验证 let foo4 = (): undefined => {} 编译通过（spec 4.7.7 行1396）
 */
let foo4 = (): undefined => {}

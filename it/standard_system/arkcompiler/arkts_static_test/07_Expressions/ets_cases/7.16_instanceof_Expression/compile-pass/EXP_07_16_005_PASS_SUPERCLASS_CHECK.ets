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
 * @id EXP_07_16_005_PASS_SUPERCLASS_CHECK
 * @expect compile-pass
 * @section 7.16
 * @design 验证子类实例 instanceof 父类编译通过（运行时为 true）
 * @note 正向用例：superclass instanceof 检查
 */
class A {}
class B extends A {}

let b = new B()
let r: boolean = b instanceof A

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
 * @id EXP_07_06_02_009_PASS_SETTER_ONLY_PROP
 * @expect compile-pass
 * @section 7.6.2
 * @design Setter-only 属性：接口只有 setter，对象字面量创建可写字段
 * @note 正向用例：验证 setter-only 属性的对象字面量创建合法
 */
interface I1 {
    set attr(attr: number)
}
const i1: I1 = {attr: 42}

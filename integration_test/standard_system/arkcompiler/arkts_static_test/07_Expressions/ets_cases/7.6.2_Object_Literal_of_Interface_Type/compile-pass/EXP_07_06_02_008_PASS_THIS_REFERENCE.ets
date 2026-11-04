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
 * @id EXP_07_06_02_008_PASS_THIS_REFERENCE
 * @expect compile-pass
 * @section 7.6.2
 * @design 对象字面量方法中 this 引用匿名类实例：返回 this 表示匿名类实例
 * @note 正向用例：验证 this 在对象字面量方法中引用匿名类实例
 */
interface I {
    method(i: I): I
}
const i: I = { method(i: I): I { return this } }

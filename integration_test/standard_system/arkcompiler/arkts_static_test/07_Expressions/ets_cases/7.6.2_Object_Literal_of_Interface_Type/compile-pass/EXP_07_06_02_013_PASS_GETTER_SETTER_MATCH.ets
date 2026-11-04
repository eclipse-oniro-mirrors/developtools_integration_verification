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
 * @id EXP_07_06_02_013_PASS_GETTER_SETTER_MATCH
 * @expect compile-pass
 * @section 7.6.2
 * @design Getter 和 setter 类型一致：get attr(): number 和 set attr(x: number) 类型相同
 * @note 正向用例：验证 getter+setter 类型一致时可创建对象字面量
 */
interface I {
    get attr(): number
    set attr(x: number)
}
const i: I = {attr: 42}

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
 * @id EXP_07_06_02_016_FAIL_GETTER_SETTER_MISMATCH
 * @expect compile-fail
 * @section 7.6.2
 * @design Getter 和 setter 类型不匹配：getter 返回 number，setter 参数 string，应为编译时错误
 * @note 反向用例：验证 getter 返回类型和 setter 参数类型必须一致
 */
interface I {
    get attr(): number
    set attr(x: string)
}
const i: I = {attr: 42}

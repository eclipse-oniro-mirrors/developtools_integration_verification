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
 * @id EXP_07_06_02_012_PASS_REGULAR_PROP
 * @expect compile-pass
 * @section 7.6.2
 * @design 普通属性：接口中普通属性，对象字面量创建可读写字段
 * @note 正向用例：验证普通属性的对象字面量创建合法（getter+setter 都可用）
 */
interface I4 {
    attr: number
}
const i4: I4 = {attr: 42}

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
 * @id EXP_07_06_02_019_FAIL_GETTER_ONLY_WRITE
 * @expect compile-fail
 * @section 7.6.2
 * @design 写入 getter-only 属性：getter-only 属性只读，赋值应编译时错误
 * @note 反向用例：验证 getter-only 属性不可写入
 */
interface I2 {
    get attr(): number
}
function test(): void {
    const i2: I2 = {attr: 42}
    i2.attr = 666
}

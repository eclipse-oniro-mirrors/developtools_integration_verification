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
 * @id EXP_07_06_01_003_PASS_SKIP_FIELDS_DEFAULTS
 * @expect compile-pass
 * @section 7.6.1
 * @design 跳过所有有默认值或显式初始化的字段：let f: Friend = {} 所有字段都有默认值或显式初始化
 * @note 正向用例：验证字段有默认值或初始化时可以全部跳过
 */
class Friend {
    public name: string = ''
    public age: number = 0
    public sex: string = 'unknown'
}
let f: Friend = {}

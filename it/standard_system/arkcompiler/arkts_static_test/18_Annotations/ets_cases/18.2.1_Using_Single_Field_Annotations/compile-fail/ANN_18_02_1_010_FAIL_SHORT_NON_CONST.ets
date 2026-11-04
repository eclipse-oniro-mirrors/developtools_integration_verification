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
 * @id ANN_18_02_1_010_FAIL_SHORT_NON_CONST
 * @expect compile-fail
 * @section 18.2.1
 * @design 验证简写形式中值必须为常量表达式
 * @note 反向用例：变量引用不是常量
 */
@interface deprecated {
  version: string
}

let x: string = 'hello'

@deprecated(x)
class C {}

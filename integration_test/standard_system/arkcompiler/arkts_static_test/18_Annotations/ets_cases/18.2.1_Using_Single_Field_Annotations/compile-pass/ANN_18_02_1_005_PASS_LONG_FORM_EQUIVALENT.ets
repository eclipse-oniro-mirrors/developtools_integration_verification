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
 * @id ANN_18_02_1_005_PASS_LONG_FORM_EQUIVALENT
 * @expect compile-pass
 * @section 18.2.1
 * @design 验证单字段注解完整对象字面量形式与简写等价
 * @note 正向用例：@deprecated({fromVersion: "5.18"}) 完整形式
 */
@interface deprecated {
  fromVersion: string
}

@deprecated({fromVersion: "5.18"})
class C {}

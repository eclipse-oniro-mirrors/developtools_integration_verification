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
 * @id TYP_03_12_021_FAIL_CLASS_NULL_FIELD_NONNULLISH
 * @expect compile-fail
 * @section 3.12
 * @design 类字段声明为 Object 类型但默认值为 null
 * @note 反向用例：验证 Object 类字段不能默认为 null
 */
class FailClass21 {
  data: Object = null
}
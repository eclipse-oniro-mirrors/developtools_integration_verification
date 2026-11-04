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
 * @id CLS_09_06_3_002_PASS_OPTIONAL_FIELD_WITH_INIT
 * @expect compile-pass
 * @section 9.6.3
 * @design optional字段含初始化器编译通过
 * @note 正向用例：optional字段可赋初始�?
 */
class OptWithInit {
  val?: number = 42
}

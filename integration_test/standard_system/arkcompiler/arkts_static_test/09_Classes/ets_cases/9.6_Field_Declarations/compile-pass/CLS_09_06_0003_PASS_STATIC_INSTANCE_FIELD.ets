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
 * @id CLS_09_06_0003_PASS_STATIC_INSTANCE_FIELD
 * @expect compile-pass
 * @section 9.6
 * @design static �?instance 字段在同一类中声明编译通过
 * @note 正向用例：验证类中同时声明static和instance字段
 */
class StaticInstance {
  static count: int = 0
  name: string = ""
  value: int = 0
}

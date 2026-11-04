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
 * @id CLS_09_07_004_FAIL_METHOD_FIELD_CONFLICT
 * @expect compile-fail
 * @section 9.7
 * @design 方法名与字段名冲突 — spec: "name of that method is already used for a field in the same declaration"
 * @note 反向用例：同声明中方法名与字段名重复应编译失败
 */
class Bad004 {
  value: int = 0
  value(): int { return 1 }
}

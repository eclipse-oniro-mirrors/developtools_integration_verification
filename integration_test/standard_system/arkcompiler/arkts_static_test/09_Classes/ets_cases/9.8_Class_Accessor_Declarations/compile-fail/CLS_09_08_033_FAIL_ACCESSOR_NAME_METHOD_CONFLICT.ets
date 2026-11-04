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
 * @id CLS_09_08_033_FAIL_ACCESSOR_NAME_METHOD_CONFLICT
 * @expect compile-fail
 * @section 9.8
 * @design 同名 accessor 与 method 占用同一命名空间，冲突应编译失败
 * @note 反向用例：get val 与方法 val() 同名，命名空间冲突
 */
class Bad33 { get val(): int { return 1 } val(): void {} }

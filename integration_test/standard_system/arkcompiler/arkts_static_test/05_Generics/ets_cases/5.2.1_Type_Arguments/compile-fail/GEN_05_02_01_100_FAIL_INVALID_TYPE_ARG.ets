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
 * @id GEN_05_02_01_100_FAIL_INVALID_TYPE_ARG
 * @expect compile-fail
 * @section 5.2.1
 * @design 非泛型类型使用类型参数应报错
 * @note 反向用例：非泛型类型不可带类型参数
 */
class NotGeneric {}
let x: NotGeneric<number> = new NotGeneric<number>();

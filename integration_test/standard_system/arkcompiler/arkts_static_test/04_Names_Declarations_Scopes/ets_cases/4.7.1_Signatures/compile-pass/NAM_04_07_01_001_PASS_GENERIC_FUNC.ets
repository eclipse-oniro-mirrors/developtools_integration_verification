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
 * @id NAM_04_07_01_001_PASS_GENERIC_FUNC
 * @expect compile-pass
 * @section 4.7.1
 * @design 泛型函数声明
 * @note 正向用例：验证泛型函数声明类型参数必须指定（§4.7 行 886）
 */
function identity<T>(x: T): T { return x; }

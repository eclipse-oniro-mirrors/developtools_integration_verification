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
 * @id EXP_07_05_01_009_PASS_ARRAY_GENERIC_CONTEXT
 * @expect compile-pass
 * @section 7.5.1
 * @design T[] 泛型类型上下文：let a: string[] = ["aa", "bb"]
 * @note 正向用例：验证 T[] 泛型类型作为上下文编译通过
 */
let a: string[] = ['aa', 'bb']

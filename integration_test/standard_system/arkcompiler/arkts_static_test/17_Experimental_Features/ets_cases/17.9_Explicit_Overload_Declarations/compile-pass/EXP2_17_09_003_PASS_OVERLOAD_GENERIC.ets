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
 * @id EXP2_17_09_003_PASS_OVERLOAD_GENERIC
 * @expect compile-pass
 * @section 17.9
 * @design overload 可使用泛型实体，显式类型参数可缩小候选范围
 * @note 正向用例：泛型函数参与 overload
 */
function idAny<T>(a: T): T { return a }
function idInt(a: int): int { return a }
function idStr(a: string): string { return a }
overload identity { idInt, idStr, idAny }

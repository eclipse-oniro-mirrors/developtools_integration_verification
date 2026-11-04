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
 * @id NAM_04_07_07_002_PASS_RETURN_UNION_VOID
 * @expect compile-pass
 * @section 4.7.7
 * @design 联合类型含 void/undefined 可省略 return
 * @note 正向用例：验证 `: number | void` 返回类型允许空函数体（§4.7 行 1378）
 */
function f1(): number | void {}
function f2(): string | undefined {}

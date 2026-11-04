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
 * @id EXP2_17_13_2_009_FAIL_UNION_TYPE_RECEIVER
 * @expect compile-fail
 * @section 17.13.2
 * @design 联合类型不能作为接收者类型 — 会产生 ESE0082
 * @note 反向用例：验证该场景应产生编译时错误
 */
class Alpha { public id: number = 0 }
class Beta { public id: number = 0 }
function showId(this: Alpha | Beta): number { return this.id}

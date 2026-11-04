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
 * @id EXP2_17_9_4_011_COMPILE_FAIL_NAMECONFLICT_IMPORT_CONFLICT
 * @expect compile-fail
 * @section 17.9.4
 * @design 验证 overload 名与导入符号冲突——应报编译错误
 * @note 反向用例：overload 声明与 import 的同名实体冲突
 */
import { PI } from "@std/math"
overload function PI(v: int): double { return 3.14 }
overload function PI(v: string): double { return 3.14 }

function main(): void {}

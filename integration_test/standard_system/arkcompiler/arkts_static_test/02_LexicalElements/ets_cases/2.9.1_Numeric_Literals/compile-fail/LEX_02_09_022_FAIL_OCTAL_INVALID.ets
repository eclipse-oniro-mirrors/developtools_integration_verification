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
 * @id LEX_02_09_022_FAIL_OCTAL_INVALID
 * @expect compile-fail
 * @section 2.9.1
 * @design 八进制字面量包含非八进制数字
 * @note compile-fail 用例：验证编译器拒绝无效八进制
 */

// 0o 后只能包含 0-7
let x: int = 0o89  // ❌ 应该报错：无效的八进制字面量

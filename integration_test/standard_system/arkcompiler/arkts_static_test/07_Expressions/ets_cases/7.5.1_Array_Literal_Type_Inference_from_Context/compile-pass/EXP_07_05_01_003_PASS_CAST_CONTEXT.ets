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
 * @id EXP_07_05_01_003_PASS_CAST_CONTEXT
 * @expect compile-pass
 * @section 7.5.1
 * @design Cast 目标类型作为上下文：let b = [1, 2, 3] as number[]
 * @note 正向用例：验证 cast 目标类型用于推断数组字面量类型
 */
let b = [1, 2, 3] as number[]

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
 * @id GEN_05_01_01_110_FAIL_CONSTRAINT_FUNC_MISMATCH
 * @expect compile-fail
 * @section 5.1.1
 * @design 函数类型约束不满足应报错
 * @note int 不满足 () => void 约束
 */
class G110<T extends () => void> {}
let x110: G110<int>
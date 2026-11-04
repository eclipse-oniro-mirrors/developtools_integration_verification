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
 * @id ENM_11_02_003_FAIL_MEMBER_NOT_ASSIGNABLE
 * @expect compile-fail
 * @section 11.2
 * @design 成员初始化器不可赋值给基类类型 → 编译错误（spec Wrong2 原例）
 * @note 反向用例：long { A = 1, B = "abc" }
 */
enum Wrong3: long { A = 1, B = "abc" }
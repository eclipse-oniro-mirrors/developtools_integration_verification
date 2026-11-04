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
 * @id ENM_11_02_002_FAIL_NON_INT_BASE_NO_INIT
 * @expect compile-fail
 * @section 11.2
 * @design 非整数基类且无初始化器 → 编译错误（spec Wrong1 原例）
 * @note 反向用例：double { A, B, C } 必须初始化
 */
enum Wrong2: double { A, B, C }
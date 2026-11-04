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
 * @id EXP_07_02_05_002_PASS_ARRAY_CREATION
 * @expect compile-pass
 * @section 7.2.5
 * @design 可伸缩数组创建表达式基本编译通过：数组字面量、new int[] 两种方式
 * @note 正向用例：验证 Resizable Array Creation Expressions 编译通过
 */
let a1: int[] = [1, 2, 3]
let a2: int[] = new int[]()
let a3: string[] = ['x', 'y', 'z']
let a4: boolean[] = [true, false, true]

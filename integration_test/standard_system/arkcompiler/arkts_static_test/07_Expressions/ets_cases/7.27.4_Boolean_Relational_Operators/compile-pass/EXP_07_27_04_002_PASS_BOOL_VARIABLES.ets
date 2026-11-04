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
 * @id EXP_07_27_04_002_PASS_BOOL_VARIABLES
 * @expect compile-pass
 * @section 7.27.4
 * @design 验证 let 声明的 boolean 变量之间关系运算编译通过
 * @note 正向用例：let boolean 变量作为操作数
 */
let a: boolean = true;
let b: boolean = false;
let r1: boolean = a < b;
let r2: boolean = a <= b;
let r3: boolean = a > b;
let r4: boolean = a >= b;
let r5: boolean = b < a;
let r6: boolean = b <= a;

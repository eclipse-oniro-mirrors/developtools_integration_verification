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
 * @id EXP2_17_02_011_FAIL_RESIZABLE_TO_FIXED
 * @expect compile-fail
 * @section 17.2
 * @design ResizableArray 赋值给 FixedArray 编译错误
 * @note 反向用例：验证 number[] 不能赋值给 Fixednumber[]
 */
let resizableArr: number[] = [1, 2, 3];
let fixedArr: Fixednumber[] = resizableArr;

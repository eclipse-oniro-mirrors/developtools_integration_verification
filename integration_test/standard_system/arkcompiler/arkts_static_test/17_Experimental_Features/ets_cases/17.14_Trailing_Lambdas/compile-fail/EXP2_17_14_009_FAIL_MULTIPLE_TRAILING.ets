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
 * @id EXP2_17_14_009_FAIL_MULTIPLE_TRAILING
 * @expect compile-fail
 * @section 17.14
 * @design 一次调用后出现多个 trailing block 应编译失败
 *        只有最后一个参数可以是 trailing lambda，不支持多个
 * @note 反向用例：多个 trailing block 不合法
 *        编译器报 ESE0124: Expected 2 arguments, got 0
 *        和 ESY0227: Unexpected token '{'
 */
function process(callback1: () => void, callback2: () => void): void {
  callback1()
  callback2()
}

process() { console.log('first') } { console.log('second') }

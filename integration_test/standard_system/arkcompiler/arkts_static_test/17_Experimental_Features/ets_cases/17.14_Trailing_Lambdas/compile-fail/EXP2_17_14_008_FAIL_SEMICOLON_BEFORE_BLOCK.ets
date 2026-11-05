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
 * @id EXP2_17_14_008_FAIL_SEMICOLON_BEFORE_BLOCK
 * @expect compile-fail
 * @section 17.14
 * @design 分号出现在调用和 block 之间时，block 不是 trailing lambda
 *        此时 process() 缺少必需参数，应编译失败
 * @note 反向用例：spec 规定分号前的 block 不作为 trailing lambda
 *        编译器报 ESE0124: Expected 1 arguments, got 0
 */
function process(callback: () => void): void {
  callback()
}

process(); { console.log('not a trailing lambda, standalone block') }

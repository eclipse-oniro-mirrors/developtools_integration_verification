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
 * @id EXP2_17_14_003_PASS_MULTI_PARAM_TRAILING
 * @expect compile-pass
 * @section 17.14
 * @design 多个普通参数在前，最后一个参数为函数类型，使用 trailing lambda 语法调用
 * @note 正向用例：验证有前置参数时 trailing lambda 仍正确解析
 */
function processWithPrefix(prefix: string, count: int, callback: () => void): void {
  console.log(prefix + count)
  callback()
}

processWithPrefix("count=", 1) { console.log('trailing with prefix') }

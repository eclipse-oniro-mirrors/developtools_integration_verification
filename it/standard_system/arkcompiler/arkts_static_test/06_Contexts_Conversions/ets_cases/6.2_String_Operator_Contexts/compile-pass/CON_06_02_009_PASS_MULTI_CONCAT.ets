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
 * @id CON_06_02_009_PASS_MULTI_CONCAT
 * @expect compile-pass
 * @section 6.2
 * @design String context: 多重 '+' 运算符级联，混合多种类型
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testMultiConcat(): void {
  let s: string = 'a=' + 10 + ', b=' + 3.14 + ', ok=' + true
  let s2: string = 1 + ' + ' + 2 + ' = ' + 3
  let s3: string = '' + null + ',' + undefined
}

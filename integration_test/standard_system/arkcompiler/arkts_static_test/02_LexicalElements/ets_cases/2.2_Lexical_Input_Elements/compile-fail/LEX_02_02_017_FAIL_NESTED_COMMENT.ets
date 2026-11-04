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
 * @id LEX_02_02_017_FAIL_NESTED_COMMENT
 * @expect compile-fail
 * @section 2.2
 * @design 嵌套多行注释（ArkTS应不支持），外层 */ 提前关闭导致后续代码出错 * @note 反向用例：验证该场景应产生编译时错误

 */
function testNestedComment(): void {
  /* outer /* inner */ still comment
  let x: number = 1
}

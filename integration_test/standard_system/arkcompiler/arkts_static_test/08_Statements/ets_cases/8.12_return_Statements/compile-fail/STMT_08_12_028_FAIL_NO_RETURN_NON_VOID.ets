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
 * @id STMT_08_12_028_FAIL_NO_RETURN_NON_VOID
 * @expect compile-fail
 * @section 8.12
 * @design 非 void 函数没有 return 语句应产生编译错误
 * @note 反向用例：验证该场景应产生编译时错误。
 */
function mustReturnInt(): int { let x: int = 5 }
function testNoReturnNonVoidFail(): void {
  mustReturnInt()
}

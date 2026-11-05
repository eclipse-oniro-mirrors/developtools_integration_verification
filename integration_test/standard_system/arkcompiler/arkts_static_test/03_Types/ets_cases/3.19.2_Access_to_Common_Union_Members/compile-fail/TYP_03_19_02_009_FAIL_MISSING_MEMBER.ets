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
 * @id TYP_03_19_02_009_FAIL_MISSING_MEMBER
 * @expect compile-fail
 * @section 3.19.2
 * @design 若某个 union 分支缺少成员 m，则访问 u.m 应失败
 * @note 反向用例：B9 没有 onlyA，参数类型保持 A9 | B9 不被初始化表达式收窄
 */
class A9 { onlyA(): void {} }
class B9 { other(): void {} }

function testMissingMemberFail(u: A9 | B9): void {
  u.onlyA()
}
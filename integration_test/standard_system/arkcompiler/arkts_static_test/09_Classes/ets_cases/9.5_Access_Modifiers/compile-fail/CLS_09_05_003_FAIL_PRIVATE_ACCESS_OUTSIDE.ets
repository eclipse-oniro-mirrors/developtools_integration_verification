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
 * @id CLS_09_05_003_FAIL_PRIVATE_ACCESS_OUTSIDE
 * @expect compile-fail
 * @section 9.5
 * @design 类外访问private成员导致编译错误
 * @note 反向用例：spec规定private仅声明类内可访问
 */
class PrivCls {
  private secret: int = 42
}
function tryAccess(p: PrivCls): void {
  let x: int = p.secret
}

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
 * @id CLS_09_05_2_003_FAIL_PROTECTED_ACCESS_OUTSIDE
 * @expect compile-fail
 * @section 9.5.2
 * @design 外部函数访问protected成员导致编译错误
 * @note 反向用例：spec规定protected仅声明类和派生类内可访问
 */
class ProtOut {
  protected count: number
}
function accessProt(c: ProtOut): void {
  c.count++
}

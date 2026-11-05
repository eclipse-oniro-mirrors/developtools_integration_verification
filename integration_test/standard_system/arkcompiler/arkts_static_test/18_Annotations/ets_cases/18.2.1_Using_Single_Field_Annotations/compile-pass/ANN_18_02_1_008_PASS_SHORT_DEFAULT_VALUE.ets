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
 * @id ANN_18_02_1_008_PASS_SHORT_DEFAULT_VALUE
 * @expect compile-pass
 * @section 18.2.1
 * @design 验证单字段有默认值时简写或省略均可
 * @note 正向用例：@timeout(30) 和 @timeout() 均可
 */
@interface timeout {
  seconds: int = 10
}

@timeout(30)
class C1 {}

@timeout()
class C2 {}

@timeout
class C3 {}

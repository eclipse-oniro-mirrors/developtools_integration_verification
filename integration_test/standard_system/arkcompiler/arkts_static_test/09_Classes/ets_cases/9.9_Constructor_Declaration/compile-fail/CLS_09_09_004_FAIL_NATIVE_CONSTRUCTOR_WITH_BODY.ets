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
 * @id CLS_09_09_004_FAIL_NATIVE_CONSTRUCTOR_WITH_BODY
 * @expect compile-fail
 * @section 9.9
 * @design native 构造器不能有方法体
 * @note 编译错误：native constructor 必须无 body
 */
class Bad004 {
  native constructor() { // 编译错误：native 构造器不能有体
    this.x = 0
  }
}

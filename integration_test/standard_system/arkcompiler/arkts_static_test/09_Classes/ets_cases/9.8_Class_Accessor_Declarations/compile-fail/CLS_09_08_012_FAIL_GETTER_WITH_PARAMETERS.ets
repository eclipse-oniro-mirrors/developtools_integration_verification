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
 * @id CLS_09_08_012_FAIL_GETTER_WITH_PARAMETERS
 * @expect compile-fail
 * @section 9.8
 * @design getter 声明时带有参数应编译失败
 * @note 反向用例：getter 不可声明任何参数；getter 必须是无参的
 */
class DataSource {
  get value(x: int): int { return x } // Compile-time error, getter has parameter
}

class Counter {
  get count(a: int, b: int): int { return a + b } // Compile-time error, getter has parameters
}

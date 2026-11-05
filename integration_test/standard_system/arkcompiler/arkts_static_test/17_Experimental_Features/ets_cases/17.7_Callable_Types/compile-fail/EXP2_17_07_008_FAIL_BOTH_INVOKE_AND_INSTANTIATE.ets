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
 * @id EXP2_17_07_008_FAIL_BOTH_INVOKE_AND_INSTANTIATE
 * @expect compile-fail
 * @section 17.7
 * @design 一个类不能同时拥有 $_invoke 和 $_instantiate，应产生编译时错误
 * @note 反向用例：类同时声明 static $_invoke 和 static $_instantiate，验证应编译失败
 */
class BothCallable {
  static $_invoke(): int {
    return 1
  }
  static $_instantiate(): BothCallable {
    return new BothCallable()
  }
}

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
 * @id EXP2_17_10_02_005_PASS_MULTIPLE_NATIVE_METHODS
 * @expect compile-pass
 * @section 17.10.2
 * @design 多个原生方法共存：验证一个类中可以包含多个原生方法，不同签名
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class MultiNativeService {
  native init(): void
  native connect(url: string): boolean
  native send(data: string): int
  native receive(): string
  native close(): void
}

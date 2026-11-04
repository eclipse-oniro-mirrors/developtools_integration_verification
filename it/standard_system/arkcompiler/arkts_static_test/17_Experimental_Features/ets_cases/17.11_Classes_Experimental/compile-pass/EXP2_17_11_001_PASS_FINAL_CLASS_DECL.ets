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
 * @id EXP2_17_11_001_PASS_FINAL_CLASS_DECL
 * @expect compile-pass
 * @section 17.11
 * @design 验证 final 类声明编译通过
 * @note 正向用例：使?final 关键字声明不可继承的?
 */
final class SealedConfig { public value: int = 0
}

function main(): void {
  let c: SealedConfig = new SealedConfig()
  console.log('final class declared')}


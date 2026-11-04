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
 * @id ENM_11_01_010_PASS_PARTIAL_INIT_INT
 * @expect compile-pass
 * @section 11.1
 * @design 部分成员无初始化器，but 全 int 兼容 → int 推断
 * @note 正向用例：spec E2 原例
 */
enum E10 { A = 5, B }

function testPartialInitInt(): void {
  let a: int = E10.A
  let b: int = E10.B
}
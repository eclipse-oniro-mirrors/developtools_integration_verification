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
 * @id CLS_09_05_3_001_PASS_PUBLIC_ACCESS_EVERYWHERE
 * @expect compile-pass
 * @section 9.5.3
 * @design public成员处处可访问编译通过
 * @note 正向用例：spec规定public成员随处可访�?
 */
class PubEverywhere {
  public data: int = 0
  public method(): void {}
}
function usePublic(p: PubEverywhere): void {
  p.data = 1
  p.method()
}

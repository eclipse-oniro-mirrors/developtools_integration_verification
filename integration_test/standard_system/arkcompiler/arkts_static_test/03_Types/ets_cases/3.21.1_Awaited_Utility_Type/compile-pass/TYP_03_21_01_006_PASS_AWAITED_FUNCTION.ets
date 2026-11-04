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
 * @id TYP_03_21_01_006_PASS_AWAITED_FUNCTION
 * @expect compile-pass
 * @section 3.21.1
 * @design Awaited<Promise<(p: Promise<string>) => Promise<number>>> → (p: Promise<string>) => Promise<number>
 * @note 正向用例：函数类型内 Promise 不展开
 */
type F = Awaited<Promise<(p: Promise<string>) => Promise<number>>>

function testAwaitedFunction(): void {
  let f: F = (p: Promise<string>): Promise<number> => {
    return p.then((s: string): number => { return s.length })
  }
}
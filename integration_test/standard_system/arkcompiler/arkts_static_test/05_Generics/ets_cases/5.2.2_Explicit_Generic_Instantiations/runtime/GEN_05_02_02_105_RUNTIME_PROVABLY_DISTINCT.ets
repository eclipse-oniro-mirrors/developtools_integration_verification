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
 * @id GEN_05_02_02_105_RUNTIME_PROVABLY_DISTINCT
 * @expect runtime
 * @section 5.2.2
 * @design provably distinct 运行时行为验证
 * @note 不同实例化类型在instanceof中可区分
 */
class G105<T> {}
function main(): void {
  let a105: Any = new G105<number>()
  let b105: Any = new G105<string>()
  if (!(a105 instanceof G105)) {
    throw new Error('G105<number> failed')
  }
  if (!(b105 instanceof G105)) {
    throw new Error('G105<string> failed')
  }
  console.log('provably distinct runtime verified')
}
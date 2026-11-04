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
 * @id EXP_07_35_04_004_RUNTIME_LAMBDA_FACTORY
 * @expect runtime
 * @section 7.35.4
 * @design Lambda 宸ュ巶姣忔鍒涘缓鐙珛浣滅敤鍩?

 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉Lambda 宸ュ巶鐙珛浣滅敤鍩?
 */
function factory(): () => int {
  let v: int = 0
  return () => { v++; return v }
}
function main(): void {
  let a: () => int = factory()
  let b: () => int = factory()
  let r1: int = a()
  let r2: int = a()
  let r3: int = b()
  if (r1 != 1) {
    throw new Error('assertion: a() first call should be 1')
  }
  if (r2 != 2) {
    throw new Error('assertion: a() second call should be 2')
  }
  if (r3 != 1) {
    throw new Error('assertion: b() first call should be 1 (independent)')
  }
console.log('verified')
}

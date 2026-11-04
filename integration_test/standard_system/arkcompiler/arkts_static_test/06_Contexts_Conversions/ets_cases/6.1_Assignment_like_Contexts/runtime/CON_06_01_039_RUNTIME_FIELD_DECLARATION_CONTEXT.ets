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
 * @id CON_06_01_039_RUNTIME_FIELD_DECLARATION_CONTEXT
 * @expect runtime
 * @section 6.1
 * @design 瀛楁澹版槑涓婁笅鏂囪繍琛屾椂琛屼负锛氱被瀛楁鍒濆鍊兼纭缃?
 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉瀛楁澹版槑璧嬪€艰涔?
 */
class Counter {
  public start: int = 0
  public step: int = 1
  public label: string = 'count'
}

function main(): void {
  let c: Counter = new Counter()
  if (c.start != 0) {
    throw new Error('assertion failed: c.start expected 0, got ' + c.start)
  }
  if (c.step != 1) {
    throw new Error('assertion failed: c.step expected 1')
  }
  if (c.label != 'count') {
    throw new Error('assertion failed: c.label expected 'count'')
  }

  console.log('Field declaration context verified')
}
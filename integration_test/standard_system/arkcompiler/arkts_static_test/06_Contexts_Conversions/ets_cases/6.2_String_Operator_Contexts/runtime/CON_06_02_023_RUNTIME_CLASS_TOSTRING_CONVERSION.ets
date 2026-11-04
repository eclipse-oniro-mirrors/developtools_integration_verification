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
 * @id CON_06_02_023_RUNTIME_CLASS_TOSTRING_CONVERSION
 * @expect runtime
 * @section 6.2
 * @design 寮曠敤绫诲瀷 string 杞崲杩愯鏃惰涓猴細class 瀹炰緥閫氳繃 toString() 鏂规硶杞崲
 * @note 杩愯鏃剁敤渚嬶細瀹為檯鎵ц楠岃瘉瀵硅薄瀹炰緥 鈫?toString() 缁撴灉
 */
class Container {
  public value: int
  constructor(v: int) {
    this.value = v
  }
}

function main(): void {
  let c: Container = new Container(42)
  let r1: string = 'container: ' + c
  let prefix: string = 'container: '
  if (r1.substring(0, prefix.length) != prefix) {
    throw new Error('assertion failed: expected prefix 'container: ', got '' + r1 + ''')
  }

  console.log('Class toString conversion verified')
}
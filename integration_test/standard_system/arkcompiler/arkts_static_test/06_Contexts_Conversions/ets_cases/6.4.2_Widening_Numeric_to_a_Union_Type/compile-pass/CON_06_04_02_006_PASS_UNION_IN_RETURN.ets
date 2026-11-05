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
 * @id CON_06_04_02_006_PASS_UNION_IN_RETURN
 * @expect compile-pass
 * @section 6.4.2
 * @design 联合类型返回: return short→byte|int(仅int更大)
 * @note 正向用例：联合返回类型的 widening
 */
function retShortAsUnion(): byte | int {
  let s: short = 42
  return s
}

function testUnionInReturn(): void {
  let r: byte | int = retShortAsUnion()
}

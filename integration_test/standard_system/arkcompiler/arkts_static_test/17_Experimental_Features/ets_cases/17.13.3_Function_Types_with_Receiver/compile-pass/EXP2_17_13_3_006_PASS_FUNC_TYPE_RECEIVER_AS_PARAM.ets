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
 * @id EXP2_17_13_3_006_PASS_FUNC_TYPE_RECEIVER_AS_PARAM
 * @expect compile-pass
 * @section 17.13.3
 * @design 带接收者的函数类型作为另一个函数的参数类型
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class MyRecord { public data: number = 0 }
type RecordOp = (this: MyRecord) => number
function applyRecordOp(rec: MyRecord, op: RecordOp): number { return op(rec) }
function testFuncTypeAsParam(): void {
  let r: MyRecord = new MyRecord(); r.data = 25
  let doubleOp: RecordOp = (this: MyRecord): number => { return this.data * 2 }
  let result: number = applyRecordOp(r, doubleOp)
  console.log('compiled successfully')
}
